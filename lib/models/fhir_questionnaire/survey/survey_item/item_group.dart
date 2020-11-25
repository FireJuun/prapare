part of 'survey_item.dart';

/// this class will represent a group - either a list of groups, a list of
/// questions, or a mixture of the two
class ItemGroup extends SurveyItem {
  ItemGroup({
    String linkId,
    String text,
    this.surveyItems,
  }) : super(linkId, text);

  factory ItemGroup.fromItem(QuestionnaireItem item) => ItemGroup(
        linkId: item.linkId,
        text: item.text,
        surveyItems: <SurveyItem>[],
      );

  /// the sublist of items
  List<SurveyItem> surveyItems;
}

/// answers that were supplied with the question (only used for Question types
/// of choice and open-choice)
// class AnswerCode extends AnswerResponse {
//   AnswerCode(String value) : super(value);
// }
