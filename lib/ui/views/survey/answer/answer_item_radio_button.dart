import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/commands/commands.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';
import 'package:prapare/ui/views/survey/question/question_item_radio_button_controller.dart';

import 'answer_item.dart';
import 'answer_title.dart';
import 'enable_when_option.dart';

class AnswerItemRadioButton extends StatelessWidget implements AnswerItem {
  const AnswerItemRadioButton(
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
    final QuestionItemRadioButtonController _controller =
        Get.find(tag: userResponse.value.questionLinkId);
    return Obx(
      () => RadioListTile<String>(
        title: AnswerTitle(answer: answer),
        value: answer.code,
        groupValue: _controller.activeCode.value,
        toggleable: true,
        onChanged: (newResponse) async {
          // close keyboard if previously open:
          FocusScope.of(context).unfocus();
          // then toggle radio button
          await ToggleRadioButtonCommand().execute(
              userResponse: userResponse,
              question: question,
              answer: answer,
              newResponse: newResponse);
          _controller.activeCode.value = newResponse;
        },
      ),
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
