import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/_internal/utils/utils.dart';
import 'package:prapare/controllers/commands/commands.dart';
import 'package:prapare/controllers/controllers.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

class AnswerItemDecimalOrStringController extends GetxController {
  AnswerItemDecimalOrStringController(
      {@required this.answer, @required this.userResponse});

  final Answer answer;
  final Rx<UserResponse> userResponse;
  final ValidationController _validationController = Get.find();
  QuestionValidators _questionValidators;

  TextEditingController textEditingController;
  final RxString obj = ''.obs;

  RxBool isQuestionDeclined() => _questionValidators.isQuestionDeclined;

  void changeFocus(bool newValue) {
    // set question expanded value only if question has been answered/declined
    if (_questionValidators.isQuestionAnswered.value ||
        _questionValidators.isQuestionDeclined.value) {
      _questionValidators.isExpanded.value = newValue;
    }
  }

  @override
  void onInit() {
    _questionValidators =
        _validationController.getQuestionValidatorByUserResponse(userResponse);
    textEditingController = TextEditingController(
        text: AnswerResponseUtil()
            .getAnswerResponseFromItemType(userResponse, answer)
            .value);
    DebounceAndSaveResponseCommand().execute(
      rxString: obj,
      answer: answer,
      userResponse: userResponse,
    );
    super.onInit();
  }

  @override
  void onClose() {
    textEditingController.dispose();
    super.onClose();
  }
}
