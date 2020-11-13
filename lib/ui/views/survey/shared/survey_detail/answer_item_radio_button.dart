import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/fhir_questionnaire/user_responses_controller.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

import 'answer_title.dart';
import 'question_item_controller.dart';

class AnswerItemRadioButton extends StatelessWidget {
  const AnswerItemRadioButton(
      {Key key, @required this.answer, @required this.userResponse})
      : super(key: key);

  final Answer answer;
  final UserResponse userResponse;

  @override
  Widget build(BuildContext context) {
    final QuestionItemController controller = Get.find();

    return RadioListTile<UserResponse>(
      title: AnswerTitle(answer: answer),
      value: userResponse,
      groupValue: userResponse,
      // groupValue: activeResponse,
      toggleable: true,
      onChanged: (newResponse) => controller.toggleRadioButtonCommand(
          oldResponse: userResponse, newResponse: newResponse),
    );
  }
}
