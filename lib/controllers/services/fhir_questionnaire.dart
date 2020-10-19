import 'package:fhir/r4.dart';
import 'package:prapare/models/data/survey/qgroup.dart';
import 'package:prapare/models/data/survey/survey.dart';
import 'package:prapare/surveys/prapare_survey.dart';

class FhirQuestionnaire {
  FhirQuestionnaire({this.questionnaire, this.response, this.survey});

  /// fhir resource questionnaire
  Questionnaire questionnaire;

  /// generated response to questionnaire
  QuestionnaireResponse response;

  /// local formatted survey from questionnaire
  Survey survey;

  void loadQuestionnaire() {
    questionnaire = Questionnaire.fromJson(prapareSurvey);
  }

  void createSurvey() {
    if (questionnaire != null) {
      survey = Survey(
        text: questionnaire.title ??
            questionnaire.name ??
            DateTime.now().hashCode.toString(),
        code: questionnaire.id?.toString() ??
            questionnaire.title ??
            questionnaire.name ??
            DateTime.now().hashCode.toString(),
        groups: _getGroups(),
      );
    }
  }

  List<Qgroup> _getGroups() => null;
}
