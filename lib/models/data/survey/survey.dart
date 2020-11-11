import 'question.dart';

/// this will be the class that is actually passed to the controller to use
/// it may be a survey, or it may just be a group of questions, but it is the
/// group of questions that should be displayed together
class Survey {
  Survey({this.code, this.title, this.text, this.questions});

  /// the code that is used to designate the particular questionnaire
  final String code;

  /// this is the title of the overall survey, not just this group of questions
  final String title;

  /// the name of the questionnaire as it will be displayed
  final String text;

  /// the list of questions to display
  List<Question> questions;
}
