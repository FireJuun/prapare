import 'package:fhir/r4.dart';
import 'package:flutter/foundation.dart';
import 'package:prapare/_internal/enums/item_type_enum.dart';

part 'answer_response.dart';

class UserResponse {
  UserResponse({
    @required this.questionLinkId,
    @required this.answers,
  });

  // not ideal, but used during first instance of reactive variables
  factory UserResponse.defaultNull() {
    return UserResponse(
      questionLinkId: null,
      answers: null,
    );
  }

  /// specifies the question
  String questionLinkId;

  /// union class of the type of responses allowed
  List<AnswerResponse> answers;
}
