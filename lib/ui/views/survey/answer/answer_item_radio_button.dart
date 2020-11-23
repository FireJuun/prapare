import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/commands/commands.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

import 'answer_title.dart';

class AnswerItemRadioButton extends StatelessWidget {
  const AnswerItemRadioButton(
      {Key key,
      @required this.answer,
      @required this.rxUserResponse,
      @required this.activeCode})
      : super(key: key);

  final Answer answer;
  final Rx<UserResponse> rxUserResponse;
  final RxString activeCode;

  @override
  Widget build(BuildContext context) {
    return Obx(() => RadioListTile<String>(
          title: AnswerTitle(answer: answer),
          value: answer.code,
          groupValue: activeCode.value,
          toggleable: true,
          onChanged: (newResponse) async {
            await ToggleRadioButtonCommand().execute(
                userResponse: rxUserResponse,
                answer: answer,
                newResponse: newResponse);
            activeCode.value = newResponse;
          },
        ));
  }
}
