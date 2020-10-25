import 'package:fhir/r4.dart';
import 'package:get/state_manager.dart';
import 'package:prapare/_internal/constants/prapare_survey.dart';
import 'package:prapare/controllers/services/fhir_questionnaire.dart';
import 'package:prapare/models/data/survey/question.dart';
import 'package:prapare/models/data/survey/survey.dart';
import 'package:prapare/models/data/survey/user_response.dart';

class SurveyModel extends GetxController {
  static SurveyModel get to => Get.find();

  /// A semi-temporary data model, which will be transitioned to harness [prapareSurvey]
  /// For now, the data points have been created manually, and the codes don't quite correlate yet

  FhirQuestionnaire _data = FhirQuestionnaire();

  //todo: implement error handling / orElse
  Survey getSurveyFromCode(String code) =>
      _data.surveys.firstWhere((e) => e.code == code, orElse: () => Survey());

  /// loads the survey (currently saved locally, but could be queried from
  /// elswhere), then creates a list of Surveys from the questionnaire
  void loadAndCreateSurvey() {
    _data.questionnaire = Questionnaire.fromJson(prapareSurvey);
    _data.title =
        _data.questionnaire?.title ?? _data.questionnaire?.name ?? 'New Survey';
    if (_data.questionnaire != null) {
      _data.surveys = <Survey>[];
      for (var item in _data.questionnaire.item) {
        if (item.type == QuestionnaireItemType.group) {
          /// creates a "Survey" from each group of questions that should be
          /// displayed together
          _surveyFromGroup(item);
        }
      }
    }
    // return questionnaire;
  }

  /// creates the survey from the group of questions that should be displayed
  /// together
  void _surveyFromGroup(QuestionnaireItem item) {
    final stillGroup = item.item
        .indexWhere((subItem) => subItem.type == QuestionnaireItemType.group);
    if (stillGroup == -1) {
      Survey newSurvey = Survey(
        code: item.linkId,
        title: _data.title,
        text: item.text,
        questions: <Question>[],
      );
      for (var q in item.item) {
        /// if the questions are single questions, it creates new question objects
        if (q.type == QuestionnaireItemType.choice) {
          newSurvey.questions.add(Question.fromChoiceItem(q));
        }
      }
      _data.surveys.add(newSurvey);
    } else {
      /// if the subItem is also a group, then it will recursively call this fxn
      for (var g in item.item) {
        _surveyFromGroup(g);
      }
    }
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
    var response = <QuestionnaireResponseItem>[];
    for (var subItem in item) {
      /// iteratively loops through each item in the item list, if it's a choice
      /// meaning that it's a question, will go ahead and craet the item in the
      /// list to return
      if (subItem.type == QuestionnaireItemType.choice) {
        var responsesForThisItem = _data.userResponses.toList();
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

  @override
  void onInit() {
    loadAndCreateSurvey();
    super.onInit();
  }
}
