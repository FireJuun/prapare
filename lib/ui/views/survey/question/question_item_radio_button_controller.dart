import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/controllers.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

class QuestionItemRadioButtonController extends GetxController {
  QuestionItemRadioButtonController(
      {@required this.group, @required this.question});
  final ItemGroup group;
  final Question question;

  final RxString activeCode = ''.obs;
  final UserResponsesController _responsesController = Get.find();

  @override
  void onInit() {
    final Rx<UserResponse> activeResponse =
        _responsesController.findActiveResponse(question.linkId);
    // returns most recent value, otherwise the default '' remains
    activeCode.value =
        _responsesController.getActiveRadioButtonValue(activeResponse) ?? '';
    super.onInit();
  }
}
