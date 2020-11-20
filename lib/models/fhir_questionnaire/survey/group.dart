import 'package:prapare/models/fhir_questionnaire/survey/survey_item.dart';

/// this class will represent a group - either a list of groups, a list of
/// questions, or a mixture of the two
class Group extends SurveyItem {
  Group({this.linkId, this.text, this.surveyItems});

  /// this is the unique code that identifies
  String linkId;

  /// this will be the text in the question displayed to the user
  String text;

  /// the sublist of items
  List<SurveyItem> surveyItems;
}
