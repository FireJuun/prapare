import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

class UserResponsesController extends GetxController {
  final RxSet<Rx<UserResponse>> _rxResponses = <Rx<UserResponse>>{}.obs;
  RxSet<Rx<UserResponse>> get rxResponses => _rxResponses;

  final RxMap<String, Rx<UserResponse>> _rxMappedActiveResponses =
      <String, Rx<UserResponse>>{}.obs;
  RxMap<String, Rx<UserResponse>> get rxMappedActiveResponses =>
      _rxMappedActiveResponses;

  void updateUserResponse(Rx<UserResponse> oldItem, UserResponse newItem) {
    oldItem.update((e) => e = newItem ?? UserResponse.defaultNull());
  }

  Rx<UserResponse> findRxUserResponse(
          {@required String surveyLinkId,
          @required String questionLinkId,
          @required String answerCode}) =>
      _rxResponses.toList().firstWhere((e) =>
          e.value.surveyLinkId == surveyLinkId &&
          e.value.questionLinkId == questionLinkId &&
          e.value.answers[0].value == answerCode);

  Rx<UserResponse> findActiveResponse(String questionLinkId) =>
      _rxMappedActiveResponses[questionLinkId];

  void setCheckboxActiveBooleanByAnswers(String questionLinkId) {
    bool validator = false;

    // get all responses for a question, then see if a response set as true
    _rxResponses
        .toList()
        .where((e) => e.value.questionLinkId == questionLinkId)
        .forEach((ans) {
      if (ans.value.answers[0].value == true) {
        validator = true;
      }
    });

    // active response value determined by above validation steps
    _rxMappedActiveResponses[questionLinkId].value.answers[0].value = validator;
  }

  void setAllQuestionBooleansToFalse(String questionLinkId) {
    _rxResponses.forEach(
      (e) {
        if (e.value.questionLinkId == questionLinkId) {
          // calls update to trigger Rx redraws, if applicable
          e.update((val) {
            val.answers[0].value = false;
          });
        }
      },
    );
  }
}
