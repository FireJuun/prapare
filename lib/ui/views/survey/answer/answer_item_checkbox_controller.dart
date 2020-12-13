import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/controllers.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

class AnswerItemCheckboxController extends GetxController {
  AnswerItemCheckboxController(
      {@required this.answer, @required this.userResponse});

  final Answer answer;
  final Rx<UserResponse> userResponse;

  final UserResponsesController _responsesController = Get.find();

  final RxBool isSelected = false.obs;

  @override
  void onInit() {
    isSelected.value =
        _responsesController.getCheckboxValueFromUserResponseAndAnswer(
                answer: answer, userResponse: userResponse) ??
            false;
    super.onInit();
  }
}
