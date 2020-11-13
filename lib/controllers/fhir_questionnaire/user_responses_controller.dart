import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';
import 'package:prapare/models/fhir_questionnaire/survey/response_type.dart';

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

  // todo: extract into standalone ToggleCheckboxCommand
  void toggleChecked(UserResponse item) {
    item.responseType.value = !item.responseType.value;
    update();
  }

  // todo: combine these, and implement viewcontroller data handling for checkboxes and for radio buttons
  // UserResponse findCheckboxResponse(
  //     {@required Survey survey, @required int qIndex, @required int ansIndex}) {
  //   final String _surveyCode = survey.code;
  //   final String _questionCode = survey.questions[qIndex].code;
  //   final String _answerCode =
  //       survey.questions[qIndex].answers.elementAt(ansIndex).code;

  //   return _rxResponses.firstWhere(
  //     (e) =>
  //         e.surveyCode == _surveyCode &&
  //         e.questionCode == _questionCode &&
  //         e.answerCode == _answerCode,
  //     orElse: () {
  //       _rxResponses.add(
  //         UserResponse(
  //           surveyCode: _surveyCode,
  //           questionCode: _questionCode,

  //           /// answer code used to match the checkbox
  //           /// boolean value determines if this is checked
  //           /// todo: ignore [false] checkbox userResponses at time of survey submission
  //           answerCode: _answerCode,
  //           responseType: ResponseBoolean(false),
  //         ),
  //       );
  //       return _rxResponses.last;
  //     },
  //   );
  // }
}
