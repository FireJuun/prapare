import 'package:prapare/models/survey/answer.dart';

/// this class will represent a single question for a survey
class Question {
  /// this is the code that will be used to identfy the question and passed back
  final String code;

  /// this will be the text in the question displayed to the user
  final String text;

  /// this will be the list of possible answers to the question
  List<Answer> answers;

  /// this will be the format of the question
  QFormat format;

  Question({this.code, this.text, this.answers, this.format});
}

/// specify how the question should be presented to the user
enum QFormat {
  radio,
  check_boxes,
  drop_down,
}
