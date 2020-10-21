import 'package:fhir/r4.dart';
import 'package:prapare/_internal/constants/prapare_survey.dart';
import 'package:prapare/models/data/survey/question.dart';
import 'package:prapare/models/data/survey/user_response.dart';
import 'package:prapare/models/data/survey/survey.dart';

class FhirQuestionnaire {
  FhirQuestionnaire({
    this.questionnaire,
    this.response,
    this.surveys,
    this.title,
    this.groups,
    this.userResponses,
  }) {
    userResponses ??= <UserResponse>[];
  }

  /// fhir resource questionnaire
  Questionnaire questionnaire;

  /// generated response to questionnaire
  QuestionnaireResponse response;

  /// local formatted survey from questionnaire
  List<Survey> surveys;

  /// Formal Title of the Entire Questionnaire
  String title;

  /// internal list
  List<String> groups;

  /// list of answers passed back from user
  List<UserResponse> userResponses;

  /// loads the survey (currently saved locally, but could be queried from
  /// elswhere), then creates a list of Surveys from the questionnaire
  void loadAndCreateSurvey() {
    questionnaire = Questionnaire.fromJson(prapareSurvey);
    title = questionnaire?.title ?? questionnaire?.name ?? 'New Survey';
    if (questionnaire != null) {
      surveys = <Survey>[];
      for (var item in questionnaire.item) {
        if (item.type == QuestionnaireItemType.group) {
          /// creates a "Survey" from each group of questions that should be
          /// displayed together
          _surveyFromGroup(item);
        }
      }
    }
  }

  /// creates the survey from the group of questions that should be displayed
  /// together
  void _surveyFromGroup(QuestionnaireItem item) {
    final stillGroup = item.item
        .indexWhere((subItem) => subItem.type == QuestionnaireItemType.group);
    if (stillGroup == -1) {
      Survey newSurvey = Survey(
        code: item.linkId,
        title: title,
        text: item.text,
        questions: <Question>[],
      );
      for (var q in item.item) {
        /// if the questions are single questions, it creates new question objects
        if (q.type == QuestionnaireItemType.choice) {
          newSurvey.questions.add(Question.fromChoiceItem(q));
        }
      }
      surveys.add(newSurvey);
    } else {
      /// if the subItem is also a group, then it will recursively call this fxn
      for (var g in item.item) {
        _surveyFromGroup(g);
      }
    }
  }

  /// adds userResponses, can do it iterativelly or all at once
  void getUserResponses(List<UserResponse> newResponses) =>
      userResponses.addAll(newResponses);

  /// to be run to create the QuestionnaireResponse resource after all questions
  /// have been answered
  void createResponse() {
    response = QuestionnaireResponse(
      resourceType: 'QuestionnaireResponse',
      meta: questionnaire.meta,
      status: QuestionnaireResponseStatus.completed,
      authored: FhirDateTime(DateTime.now()),

      /// uses original questionnaire for formatting purposes
      item: _getResponse(questionnaire.item),
    );
  }

  List<QuestionnaireResponseItem> _getResponse(List<QuestionnaireItem> item) {
    var response = <QuestionnaireResponseItem>[];
    for (var subItem in item) {
      /// iteratively loops through each item in the item list, if it's a choice
      /// meaning that it's a question, will go ahead and craet the item in the
      /// list to return
      if (subItem.type == QuestionnaireItemType.choice) {
        var responsesForThisItem = userResponses.toList();
        responsesForThisItem
            .retainWhere((response) => response.questionCode == subItem.linkId);
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
    var responseAnswer = <QuestionnaireResponseAnswer>[];
    for (var answer in responsesForThisItem) {
      var thisAnswer = item.answerOption.firstWhere(
          (option) => option.valueCoding.code == Code(answer.answerCode),
          orElse: () => null);
      responseAnswer.add(
          QuestionnaireResponseAnswer(valueCoding: thisAnswer?.valueCoding));
    }
    return responseAnswer;
  }
}
