import 'package:fhir/r4.dart';

import 'survey/export.dart';

class FhirQuestionnaire {
  FhirQuestionnaire({
    this.questionnaire,
    this.response,
    this.survey,
    this.title,
    this.userResponses,
  }) {
    userResponses ??= <UserResponse>[];
  }

  /// fhir resource questionnaire
  Questionnaire questionnaire;

  /// fhir generated response to questionnaire
  QuestionnaireResponse response;

  /// local formatted survey from questionnaire, passed to the front-end
  Survey survey;

  /// Formal Title of the Entire Questionnaire
  String title;

  /// list of answers passed back from user
  List<UserResponse> userResponses;
}
