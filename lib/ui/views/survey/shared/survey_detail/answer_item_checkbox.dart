import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/fhir_questionnaire/questionnaire_controller.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

import 'answer_title.dart';
import 'question_item_controller.dart';

class AnswerItemCheckbox extends StatelessWidget {
  const AnswerItemCheckbox(
      {Key key,
      @required this.survey,
      @required this.question,
      @required this.answer})
      : super(key: key);

  final Survey survey;
  final Question question;
  final Answer answer;

  @override
  Widget build(BuildContext context) {
    final QuestionItemController controller = Get.find();

    final UserResponse userResponse = controller.findUserResponse();
    final UserResponse activeResponse = controller.findActiveResponse();

    return CheckboxListTile(
        title: AnswerTitle(answer: answer),
        value: userResponse.responseType.value,
        onChanged: (newValue) =>
            controller.toggleCheckboxCommand(userResponse: userResponse));
  }
}
