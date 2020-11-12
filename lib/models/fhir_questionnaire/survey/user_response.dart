import 'package:flutter/foundation.dart';

/// represents the class that is passed back from the user
class UserResponse {
  UserResponse({
    @required this.surveyCode,
    @required this.questionCode,
    @required this.answerCode,
    this.answerBoolean = false,
    this.answerDecimal = 0.0,
    this.answerString = '',
  });

  /// specifies the survey
  String surveyCode;

  /// specifies the question
  String questionCode;

  /// specifies the answer
  String answerCode;

  /// In some cases, boolean answers are accepted
  bool answerBoolean;

  /// In other cases, decimals are accepted
  /// While FHIR accepts this resource as a decimal...
  /// Our current data elements only needs integers
  double answerDecimal;

  /// Finally, such as with Optional questions or addresses
  /// Write-in answers are accepted
  String answerString;
}
