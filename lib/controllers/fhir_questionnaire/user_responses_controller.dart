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
          {@required String surveyCode,
          @required String questionCode,
          @required String answerCode}) =>
      _rxResponses.toList().firstWhere((e) =>
          e.value.surveyCode == surveyCode &&
          e.value.questionCode == questionCode &&
          e.value.answerCode == answerCode);

  Rx<UserResponse> findActiveResponse(String questionCode) =>
      _rxMappedActiveResponses[questionCode];

  void setCheckboxActiveBooleanByAnswers(String questionCode) {
    bool validator = false;

    // get all responses for a question, then see if a response set as true
    _rxResponses
        .toList()
        .where((e) => e.value.questionCode == questionCode)
        .forEach((ans) {
      if (ans.value.responseType.value == true) {
        validator = true;
      }
    });

    // active response value determined by above validation steps
    _rxMappedActiveResponses[questionCode].value.responseType.value = validator;
  }

  void setAllQuestionBooleansToFalse(String questionCode) {
    _rxResponses.forEach(
      (e) {
        if (e.value.questionCode == questionCode) {
          // calls update to trigger Rx redraws, if applicable
          e.update((val) {
            val.responseType.value = false;
          });
        }
      },
    );
  }
}
