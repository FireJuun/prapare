import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/commands/commands.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

import 'answer_title.dart';

class AnswerItemCheckbox extends StatelessWidget {
  const AnswerItemCheckbox(
      {Key key, @required this.answer, @required this.rxUserResponse})
      : super(key: key);

  final Answer answer;
  final Rx<UserResponse> rxUserResponse;

  @override
  Widget build(BuildContext context) {
    return Obx(() => CheckboxListTile(
        title: AnswerTitle(answer: answer),
        value: rxUserResponse.value.answers[0].value,
        onChanged: (newValue) async =>
            ToggleCheckboxCommand().execute(rxUserResponse: rxUserResponse)));
  }
}
