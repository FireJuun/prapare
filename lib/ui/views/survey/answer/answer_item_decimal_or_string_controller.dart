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

  TextEditingController textEditingController;
  final RxString obj = ''.obs;

  QuestionValidators _getQuestionValidator() => Get.find<ValidationController>()
      .getQuestionValidatorByUserResponse(userResponse);

  RxBool isQuestionDeclined() => _getQuestionValidator().isQuestionDeclined;

  @override
  void onInit() {
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
