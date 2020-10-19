import 'package:fhir/r4.dart';
import 'package:prapare/models/data/survey/answer.dart';
import 'package:prapare/models/data/survey/question.dart';
import 'package:prapare/models/data/survey/survey.dart';
import 'package:prapare/surveys/prapare_survey.dart';

class FhirQuestionnaire {
  FhirQuestionnaire({
    this.questionnaire,
    this.response,
    this.surveys,
    this.title,
    this.groups,
  });

  /// fhir resource questionnaire
  Questionnaire questionnaire;

  /// generated response to questionnaire
  QuestionnaireResponse response;

  /// local formatted survey from questionnaire
  List<Survey> surveys;

  String title;

  List<String> groups;

  /// loads the survey (currently saved locally, but could be queried from
  /// elswhere), then creates a list of Surveys from the questionnaire
  void loadAndCreateSurvey() {
    questionnaire = Questionnaire.fromJson(prapareSurvey);
    title = questionnaire?.title ?? questionnaire?.name ?? 'New Survey';
    if (questionnaire != null) {
      surveys = <Survey>[];
      for (var item in questionnaire.item) {
        if (item.type == QuestionnaireItemType.group) {
          _surveyFromGroup(item);
        }
      }
    }
  }

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
        if (q.type == QuestionnaireItemType.choice) {
          newSurvey.questions.add(Question.fromChoiceItem(q));
        }
      }
      surveys.add(newSurvey);
    } else {
      for (var g in item.item) {
        _surveyFromGroup(g);
      }
    }
  }

  void createResponse(List<Answer> answers) {
    response = QuestionnaireResponse(
      resourceType: 'QuestionnaireResponse',
      meta: questionnaire.meta,
      status: QuestionnaireResponseStatus.completed,
      authored: FhirDateTime(DateTime.now()),
      item: _getAnswers(),
    );
  }

  List<QuestionnaireResponseItem> _getAnswers() {}
}
