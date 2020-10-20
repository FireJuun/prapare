/// represents the class that is passed back from the user
class UserResponse {
  /// specifies the survey
  String surveyCode;

  /// specifies the question
  String questionCode;

  /// specifies the answer
  String answerCode;

  UserResponse({
    this.surveyCode,
    this.questionCode,
    this.answerCode,
  });
}
