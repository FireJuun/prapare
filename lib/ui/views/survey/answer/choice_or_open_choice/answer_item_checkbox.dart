import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/commands/commands.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';
import 'package:prapare/ui/views/survey/answer/answer_item.dart';

import 'answer_item_checkbox_controller.dart';
import '../answer_title.dart';
import '../enable_when_option.dart';

class AnswerItemCheckbox extends StatelessWidget implements AnswerItem {
  const AnswerItemCheckbox(
      {Key key,
      @required this.question,
      @required this.answer,
      @required this.userResponse})
      : assert(question != null),
        assert(answer != null),
        assert(userResponse != null),
        super(key: key);

  @override
  final Question question;
  @override
  final Answer answer;
  @override
  final Rx<UserResponse> userResponse;

  @override
  Widget buildAnswer(BuildContext context) {
    return GetX<AnswerItemCheckboxController>(
      init: AnswerItemCheckboxController(
          answer: answer, userResponse: userResponse),
      tag: answer.code,
      initState: (_) {},
      builder: (controller) {
        return CheckboxListTile(
          title: AnswerTitle(answer: answer),
          value: controller.isSelected.value,
          onChanged: (newValue) async {
            // close keyboard if previously open:
            FocusScope.of(context).unfocus();
            // then toggle checkbox
            ToggleCheckboxCommand().execute(
                question: question,
                userResponse: userResponse,
                answer: answer,
                newValue: newValue);
            controller.isSelected.value = newValue;
          },
        );
      },
    );
  }

  @override
  Widget buildAnswerAndEnableWhenOption(BuildContext context) =>
      EnableWhenOption(
        question: question,
        answer: answer,
        userResponse: userResponse,
        answerItemWidget: buildAnswer(context),
      );

  @override
  Widget build(BuildContext context) => buildAnswerAndEnableWhenOption(context);
}
