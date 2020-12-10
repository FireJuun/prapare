import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/commands/commands.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';
import 'package:prapare/ui/views/survey/question/question_item_radio_button_controller.dart';

import 'answer_item.dart';
import 'answer_title.dart';

class AnswerItemRadioButton extends StatelessWidget implements AnswerItem {
  const AnswerItemRadioButton({
    Key key,
    @required this.answer,
    @required this.rxUserResponse,
  })  : assert(answer != null),
        assert(rxUserResponse != null),
        super(key: key);

  @override
  final Answer answer;
  @override
  final Rx<UserResponse> rxUserResponse;

  @override
  Widget buildAnswer(BuildContext context) {
    final QuestionItemRadioButtonController _controller =
        Get.find(tag: rxUserResponse.value.questionLinkId);
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
              userResponse: rxUserResponse,
              answer: answer,
              newResponse: newResponse);
          _controller.activeCode.value = newResponse;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) => buildAnswer(context);
}
