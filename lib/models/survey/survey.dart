/// this will be the class that is actually passed to the controller to use
class Survey {
  /// the code that is used to designate the particular questionnaire
  final String code;

  /// the name of the questionnaire as it will be displayed
  final String text;

  /// the list of questions in the questionnaire or survey
  List<String> questions;

  Survey({this.code, this.text, this.questions});
}
