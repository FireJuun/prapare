import 'package:fhir/r4.dart';

/// store the answers to your survey or questionnaire in this class
class Answer {
  Answer({this.code, this.text});

  Answer.fromAnswerOption(QuestionnaireAnswerOption answer) {
    code = answer?.valueCoding?.code?.toString();
    text = answer?.valueCoding?.display?.toString();
  }

  /// this is code the package will use to identify and pass back the answer
  String code;

  /// this is the text that will be displayed to the user of the survey
  String text;
}
