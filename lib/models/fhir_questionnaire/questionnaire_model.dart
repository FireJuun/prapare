// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:fhir/r4.dart';
import 'package:get/get.dart';
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
  void loadAndCreateSurvey() {
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

  /// adds userResponses, can do it iterativelly or all at once
  void getUserResponses(List<UserResponse> newResponses) =>
      _data.userResponses.addAll(newResponses);

  /// to be run to create the QuestionnaireResponse resource after all questions
  /// have been answered
  void createResponse() {
    _data.response = QuestionnaireResponse(
      resourceType: 'QuestionnaireResponse',
      meta: _data.questionnaire.meta,
      status: QuestionnaireResponseStatus.completed,
      authored: FhirDateTime(DateTime.now()),

      /// uses original questionnaire for formatting purposes
      item: _getResponse(_data.questionnaire.item),
    );
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
      final QuestionnaireAnswerOption thisAnswer = item.answerOption.firstWhere(
          (option) => option.valueCoding.code == Code(answer.questionLinkId),
          orElse: () => null);
      responseAnswer.add(
          QuestionnaireResponseAnswer(valueCoding: thisAnswer?.valueCoding));
    }
    return responseAnswer;
  }

  Future saveResponses() async {
    final saveResult = await DbInterface().save(_data.response);
    saveResult.fold(
      (l) => Get.snackbar('Error: ', l.errorMessage),
      (r) => Get.snackbar('Saved', 'Survey Successfully Saved'),
    );
  }
}
