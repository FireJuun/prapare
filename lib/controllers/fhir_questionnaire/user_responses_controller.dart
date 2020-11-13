import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

class UserResponsesController extends GetxController {
  static UserResponsesController get to => Get.find();

  final RxSet<UserResponse> _rxResponses = <UserResponse>{}.obs;
  RxSet<UserResponse> get rxResponses => _rxResponses;

  final RxMap<String, UserResponse> _rxMappedActiveResponses =
      <String, UserResponse>{}.obs;
  RxMap<String, UserResponse> get rxMappedActiveResponses =>
      _rxMappedActiveResponses;

  void updateUserResponse(UserResponse item) {
    // check for previous response by survey/question/answer
    final index = _findResponseIndex(item);

    // remove old response, if present, then add new response
    _rxResponses.remove(_rxResponses.elementAt(index));
    _rxResponses.add(item);

    update();
  }

  int _findResponseIndex(UserResponse item) {
    // Get index of the set that satisfies the condition
    return _rxResponses.toList().indexWhere((e) =>
        e.surveyCode == item.surveyCode &&
        e.questionCode == item.questionCode &&
        e.answerCode == item.answerCode);
  }

  UserResponse findUserResponse(
          {@required String surveyCode,
          @required String questionCode,
          @required String answerCode}) =>
      _rxResponses.toList().firstWhere((e) =>
          e.surveyCode == surveyCode &&
          e.questionCode == questionCode &&
          e.answerCode == answerCode);

  UserResponse findActiveResponse(String questionCode) =>
      _rxMappedActiveResponses[questionCode];

  void setAllQuestionBooleansToFalse(String questionCode) {
    _rxResponses.forEach(
      (e) {
        if (e.questionCode == questionCode) {
          e.responseType.value = false;
        }
      },
    );
    update();
  }
}
