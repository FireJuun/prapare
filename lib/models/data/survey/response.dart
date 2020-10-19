/// represents the class that is passed back from the user
class Response {
  /// specifies the survey
  String surveyCode;

  /// specifies the question
  String questionCode;

  /// specifies the answer
  String answerCode;

  Response({
    this.surveyCode,
    this.questionCode,
    this.answerCode,
  });
}
