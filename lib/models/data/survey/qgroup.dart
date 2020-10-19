import 'question.dart';

/// survey questions are often sorted into groups
class Qgroup {
  /// code for that specific group, if there is only one group of questions,
  /// this code will be the same as for the full survey
  final String code;

  /// text display for the group, if there is only one group of questions,
  /// this code will be the same as for the full survey
  final String text;

  /// this list of questions associated with this group
  List<Question> questions;

  Qgroup({this.code, this.text, this.questions});
}
