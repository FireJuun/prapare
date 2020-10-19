/// represents the class that is passed back from the user
class Response {
  /// specifies the survey
  final String surveyCode;

  /// specifices the group
  final String groupCode;

  /// specifies the question
  final String questionCode;

  /// specifies the answer
  final String answerCode;

  Response({
    this.surveyCode,
    this.groupCode,
    this.questionCode,
    this.answerCode,
  });
}
