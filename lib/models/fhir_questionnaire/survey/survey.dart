import 'survey_item/survey_item.dart';

/// this will be the class that is actually passed to the controller to use
/// it may be a survey, or it may just be a group of questions, but it is the
/// group of questions that should be displayed together
class Survey {
  Survey({this.linkId, this.text, this.surveyItems});

  /// the unique code for this particular questionnaire
  final String linkId;

  /// the name of the questionnaire as it will be displayed
  final String text;

  /// the list sub-items
  List<SurveyItem> surveyItems;
}
