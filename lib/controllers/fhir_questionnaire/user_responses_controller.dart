import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

class UserResponsesController extends GetxController {
  final RxMap<String, Rx<UserResponse>> _rxUserResponsesMap =
      <String, Rx<UserResponse>>{}.obs;
  RxMap<String, Rx<UserResponse>> get rxUserResponsesMap => _rxUserResponsesMap;

  void updateUserResponse(Rx<UserResponse> oldItem, UserResponse newItem) {
    oldItem.update((e) => e = newItem ?? UserResponse.defaultNull());
  }

  Rx<UserResponse> findRxUserResponse(
          {@required String questionLinkId, @required String answerCode}) =>
      _rxUserResponsesMap[questionLinkId];

  // todo: handle if no response
  Rx<UserResponse> findActiveResponse(String questionLinkId) =>
      _rxUserResponsesMap[questionLinkId];

  // Get the first answer in the list, or default to '' if no answer is set
  String getActiveRadioButtonValue(Rx<UserResponse> userResponse) {
    if (userResponse.value.answers.isEmpty) {
      return '';
    } else {
      // for radio buttons, the first answer will always be the active one
      final AnswerResponse firstAnswer = userResponse.value.answers.first;

      if (firstAnswer is AnswerCode) {
        // ItemType.choice options use value to store their code
        return firstAnswer.value;
      } else if (firstAnswer is AnswerOther) {
        // ItemType.other options use code to store their code
        return firstAnswer.code;
      } else
        return '';
    }
  }

  void setCheckboxActiveBooleanByAnswers(String questionLinkId) {
    // todo: fix
    // bool validator = false;

    // // get all responses for a question, then see if a response set as true
    // _rxResponses
    //     .toList()
    //     .where((e) => e.value.questionLinkId == questionLinkId)
    //     .forEach((ans) {
    //   if (ans.value.answers[0].value == true) {
    //     validator = true;
    //   }
    // });

    // // active response value determined by above validation steps
    // _rxUserResponsesMap[questionLinkId].value.answers[0].value = validator;
  }

  void setAllQuestionBooleansToFalse(String questionLinkId) {
    // todo: fix
    //   _rxResponses.forEach(
    //     (e) {
    //       if (e.value.questionLinkId == questionLinkId) {
    //         // calls update to trigger Rx redraws, if applicable
    //         e.update((val) {
    //           val.answers[0].value = false;
    //         });
    //       }
    //     },
    //   );
  }
}
