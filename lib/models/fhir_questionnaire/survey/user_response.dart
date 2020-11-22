import 'package:fhir/r4.dart';
import 'package:flutter/foundation.dart';
import 'package:prapare/models/fhir_questionnaire/survey/item_type.dart';

part 'answer_response.dart';

/// represents the class that is passed back from the user
class RxUserResponse {}

class UserResponse {
  UserResponse({
    // @required this.surveyLinkId,
    @required this.questionLinkId,
    @required this.answers,
  });

  // not ideal, but used during first instance of reactive variables
  factory UserResponse.defaultNull() {
    return UserResponse(
      // surveyLinkId: null,
      questionLinkId: null,
      answers: null,
    );
  }

  /// specifies the survey
  // String surveyLinkId;

  /// specifies the question
  String questionLinkId;

  /// union class of the type of responses allowed
  List<AnswerResponse> answers;
}
