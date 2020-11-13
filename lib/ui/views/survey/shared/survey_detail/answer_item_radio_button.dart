import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/controllers.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

import 'answer_title.dart';
import 'question_item_controller.dart';

class AnswerItemRadioButton extends StatelessWidget {
  const AnswerItemRadioButton(
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

    return RadioListTile<UserResponse>(
      title: AnswerTitle(answer: answer),
      value: userResponse,
      groupValue: activeResponse,
      toggleable: true,
      onChanged: (newResponse) => controller.toggleRadioButtonCommand(
          oldResponse: userResponse, newResponse: newResponse),
    );
  }
}
