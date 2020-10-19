/// represents the class that is passed back from the user
class Response {
  /// specifies the survey
  final String surveyCode;

  /// specifies the question
  final String questionCode;

  /// specifies the answer
  final String answerCode;

  Response({this.surveyCode, this.questionCode, this.answerCode});
}
