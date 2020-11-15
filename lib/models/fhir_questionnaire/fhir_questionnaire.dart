import 'package:fhir/r4.dart';

import 'survey/export.dart';

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
}
