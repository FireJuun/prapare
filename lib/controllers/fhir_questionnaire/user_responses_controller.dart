import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:prapare/_internal/utils/utils.dart';
import 'package:prapare/controllers/controllers.dart';
import 'package:prapare/controllers/fhir_questionnaire/validation_controller.dart';
import 'package:prapare/models/fhir_questionnaire/survey/enums/qformat.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

class UserResponsesController extends GetxController {
  // format: <QuestionLinkId, UserResponse>
  final Map<String, Rx<UserResponse>> _userResponsesMap =
      <String, Rx<UserResponse>>{};
  Map<String, Rx<UserResponse>> get userResponsesMap => _userResponsesMap;

  void updateUserResponse(Rx<UserResponse> oldItem, UserResponse newItem) {
    oldItem.update((e) => e = newItem ?? UserResponse.defaultNull());
  }

  // todo: handle if no response
  Rx<UserResponse> findActiveResponse(String questionLinkId) =>
      _userResponsesMap[questionLinkId];

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

  /// placeholder method, in case we want to still keep
  /// previously written items (e.g. 'other' responses)
  void clearAllUserResponses(Rx<UserResponse> userResponse) {
    /// use the userResponse ID to find the original question ID
    final QuestionnaireController questionnaireController = Get.find();
    final question =
        questionnaireController.getQuestionFromUserResponse(userResponse);

    /// different data types (e.g. bool, choice, open_choice, check_box) are stored differently
    /// as such, their data must be cleared differently
    /// the AnswerResponse utility class handles this
    question.answers.forEach((answer) {
      UserResponseUtil().clearUserResponse(
          answer: answer, userResponse: userResponse, qFormat: question.format);
    });

    if (question.format == QFormat.radio_button) {
      UserResponseUtil()
          .findAndResetQuestionItemRadioButtonController(userResponse);
    }

    /// finally, validate if the question is completed
    /// as defined by data entered or data
    Get.find<ValidationController>()
        .validateIfQuestionAndGroupAreCompleted(userResponse);
  }

  bool getCheckboxValueFromUserResponseAndAnswer(
      {@required Answer answer, @required Rx<UserResponse> userResponse}) {
    /// empty lists are always false
    if (userResponse.value.answers.isEmpty) {
      return false;
    } else {
      /// lists with values return the value that matches the code
      /// but if no match can be found, it also returns false
      final hasData = userResponse.value.answers.firstWhere(
          (element) => getAnswerResponseCode(element) == answer.code,
          orElse: () => null);
      return hasData != null;
    }
  }

  String getAnswerResponseCode(AnswerResponse answerResponse) {
    // AnswerCodes store their answer code in 'value', but AnswerOther stores it in 'code'
    if (answerResponse is AnswerCode) {
      return answerResponse.value;
    } else if (answerResponse is AnswerOther) {
      return answerResponse.code;
    } else
      // todo: use null instead of ''?
      return '';
  }
}
