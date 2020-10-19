import 'qgroup.dart';

/// this will be the class that is actually passed to the controller to use
class Survey {
  /// the code that is used to designate the particular questionnaire
  final String code;

  /// the name of the questionnaire as it will be displayed
  final String text;

  List<Qgroup> groups;

  Survey({this.code, this.text, this.groups});
}
