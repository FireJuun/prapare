import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

class UserResponsesController extends GetxController {
  static UserResponsesController get to => Get.find();

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
