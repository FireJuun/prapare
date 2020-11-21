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
    //todo: wrap in obx
    return CheckboxListTile(
        title: AnswerTitle(answer: answer),
        value: false,
        // value: rxUserResponse.value.answers[1].value ?? '',
        onChanged: (newValue) async =>
            ToggleCheckboxCommand().execute(rxUserResponse: rxUserResponse));
  }
}
