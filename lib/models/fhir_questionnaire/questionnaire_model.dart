// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:fhir/r4.dart';
import 'package:prapare/_internal/constants/prapare_survey.dart';
import 'package:prapare/services/db_interface.dart';

import 'fhir_questionnaire.dart';
import 'survey/export.dart';
import 'survey/survey_item/survey_item.dart';

class QuestionnaireModel {
  final FhirQuestionnaire _data = FhirQuestionnaire();
  FhirQuestionnaire get data => _data;

  /// loads the survey (currently saved locally, but could be queried from
  /// elswhere), then creates a list of Surveys from the questionnaire
  Future<bool> loadAndCreateSurvey() async {
    _data.questionnaire = Questionnaire.fromJson(prapareSurvey);
    _data.title =
        _data.questionnaire?.title ?? _data.questionnaire?.name ?? 'New Survey';
    if (_data.questionnaire != null) {
      if (_data.questionnaire.item != null) {
        if (_data.questionnaire.item[0].type == QuestionnaireItemType.group) {
          /// creates a Survey from the initial group
          /// ToDo: generalize for cases where there is only one group
          /// encasing everything else as is currently true in PRAPARE

          _data.survey = Survey(
            linkId: _data.questionnaire.item[0].linkId,
            text: _data.questionnaire.item[0].text,
            surveyItems: <SurveyItem>[],
          );
          for (var item in _data.questionnaire.item[0].item) {
            _data.survey.surveyItems.add(_itemFromItem(item));
          }
        }
      }
    }
    return true;
  }

  /// creates a new surveyItem from the fhir item that is passed
  SurveyItem _itemFromItem(QuestionnaireItem item) {
    var surveyItem;

    /// first checks if the item is a group, if so, recursively calls this
    /// function to add surveyItems to the groups subitems
    if (item.type == QuestionnaireItemType.group) {
      surveyItem = ItemGroup.fromItem(item);
      for (var subItem in item.item) {
        surveyItem.surveyItems.add(_itemFromItem(subItem));
      }
    } else {
      /// if the item is not a group it is a question
      /// ToDo: display - not a question or group
      surveyItem = Question.fromItem(item);
    }
    return surveyItem;
  }

  /// saves the Questionnaire locally
  Future<Resource> saveResponses(List<UserResponse> responses) async {
    _data.userResponses.retainWhere((r) => false);
    _data.userResponses.addAll(responses);
    _data.response = QuestionnaireResponse(
      resourceType: 'QuestionnaireResponse',
      meta: _data.questionnaire.meta,
      status: QuestionnaireResponseStatus.completed,
      authored: FhirDateTime(DateTime.now()),
      // uses original questionnaire for formatting purposes
      item: _getResponse(_data.questionnaire.item),
    );
    final saveResult = await DbInterface().save(_data.response);

    saveResult.fold(
      (l) => print(l.errorMessage),
      (r) {
        return r;
      },
    );
    return null;
  }

  List<QuestionnaireResponseItem> _getResponse(List<QuestionnaireItem> item) {
    final response = <QuestionnaireResponseItem>[];
    for (var subItem in item) {
      /// iteratively loops through each item in the item list, if it's a choice
      /// meaning that it's a question, will go ahead and craet the item in the
      /// list to return
      if (subItem.type == QuestionnaireItemType.choice) {
        final List<UserResponse> responsesForThisItem =
            _data.userResponses.toList();
        responsesForThisItem.retainWhere(
            (response) => response.questionLinkId == subItem.linkId);
        if (responsesForThisItem.isNotEmpty) {
          response.add(
            QuestionnaireResponseItem(
              linkId: subItem.linkId,
              text: subItem.text,
              answer: _getAnswers(
                subItem,
                responsesForThisItem,
              ),
            ),
          );
        }

        /// if it's not a question and is just a group of questions, it passes
        /// each group to itself
      } else if (subItem.type == QuestionnaireItemType.group) {
        response.add(
          QuestionnaireResponseItem(
            linkId: subItem.linkId,
            text: subItem.text,
            item: _getResponse(subItem.item),
          ),
        );
      }
    }
    return response;
  }

  /// copies over the answers to that specific question using the formatting
  /// from the original questionnaire
  List<QuestionnaireResponseAnswer> _getAnswers(
      QuestionnaireItem item, List<UserResponse> responsesForThisItem) {
    final responseAnswer = <QuestionnaireResponseAnswer>[];
    for (var answer in responsesForThisItem) {
      for (var response in answer.answers) {
        QuestionnaireAnswerOption thisAnswer;
        switch (response.runtimeType) {
          case AnswerCode:
            {
              thisAnswer = item.answerOption.firstWhere(
                  (option) =>
                      option.valueCoding.code ==
                      Code(response.value.split('/').last),
                  orElse: () => null);
              if (thisAnswer != null) {
                responseAnswer.add(QuestionnaireResponseAnswer(
                    valueCoding: thisAnswer?.valueCoding));
              }
              break;
            }
          case AnswerOther:
            {
              responseAnswer.add(
                  QuestionnaireResponseAnswer(valueString: response.value));
              break;
            }
          case AnswerBoolean:
            {
              responseAnswer.add(QuestionnaireResponseAnswer(
                  valueBoolean: Boolean(response.value)));
              break;
            }
          case AnswerDecimal:
            {
              responseAnswer.add(QuestionnaireResponseAnswer(
                  valueDecimal: Decimal(response.value)));
              break;
            }
          case AnswerInteger:
            {
              responseAnswer.add(QuestionnaireResponseAnswer(
                  valueInteger: Integer(response.value)));
              break;
            }
          case AnswerString:
            {
              responseAnswer.add(
                  QuestionnaireResponseAnswer(valueString: response.value));
              break;
            }
          case AnswerText:
            {
              responseAnswer.add(
                  QuestionnaireResponseAnswer(valueString: response.value));
              break;
            }
          case AnswerDate:
            {
              responseAnswer.add(
                  QuestionnaireResponseAnswer(valueDate: Date(response.value)));
              break;
            }
          case AnswerTime:
            {
              final DateTime dateTime = response.value;
              final time = '${dateTime.hour.toString().padLeft(2, "0")}:'
                  '${dateTime.minute.toString().padLeft(2, "0")}:'
                  '${dateTime.second.toString().padLeft(2, "0")}';
              responseAnswer
                  .add(QuestionnaireResponseAnswer(valueTime: Time(time)));
              break;
            }
          case AnswerDateTime:
            {
              responseAnswer.add(QuestionnaireResponseAnswer(
                  valueDateTime: FhirDateTime(response.value)));
              break;
            }
          case AnswerUrl:
            {
              responseAnswer.add(QuestionnaireResponseAnswer(
                  valueUri: FhirUri(response.value)));
              break;
            }
          case AnswerAttachment:
            {
              responseAnswer.add(
                  QuestionnaireResponseAnswer(valueAttachment: response.value));
              break;
            }
          case AnswerReference:
            {
              responseAnswer.add(
                  QuestionnaireResponseAnswer(valueReference: response.value));
              break;
            }
          case AnswerQuantity:
            {
              responseAnswer.add(
                  QuestionnaireResponseAnswer(valueQuantity: response.value));
              break;
            }
        }
      }
    }
    return responseAnswer;
  }
}
