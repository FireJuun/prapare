import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

import 'answer_title.dart';
import 'question_item_controller.dart';

class AnswerItemCheckbox extends StatelessWidget {
  const AnswerItemCheckbox(
      {Key key, @required this.answer, @required this.userResponse})
      : super(key: key);

  final Answer answer;
  final UserResponse userResponse;

  @override
  Widget build(BuildContext context) {
    final QuestionItemController controller = Get.find();

    return CheckboxListTile(
        title: AnswerTitle(answer: answer),
        value: userResponse.responseType.value,
        onChanged: (newValue) =>
            controller.toggleCheckboxCommand(userResponse: userResponse));
  }
}
