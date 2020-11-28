import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/commands/commands.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

import 'answer_item.dart';
import 'answer_title.dart';

class AnswerItemRadioButton extends StatelessWidget implements AnswerItem {
  const AnswerItemRadioButton(
      {Key key,
      @required this.answer,
      @required this.rxUserResponse,
      @required this.activeCode})
      : assert(answer != null),
        assert(rxUserResponse != null),
        super(key: key);

  @override
  final Answer answer;
  @override
  final Rx<UserResponse> rxUserResponse;
  final RxString activeCode;

  @override
  Widget buildItem(BuildContext context) => Obx(
        () => RadioListTile<String>(
          title: AnswerTitle(answer: answer),
          value: answer.code,
          groupValue: activeCode.value,
          toggleable: true,
          onChanged: (newResponse) async {
            // close keyboard if previously open:
            FocusScope.of(context).unfocus();
            // then toggle radio button
            await ToggleRadioButtonCommand().execute(
                userResponse: rxUserResponse,
                answer: answer,
                newResponse: newResponse);
            activeCode.value = newResponse;
          },
        ),
      );

  @override
  Widget build(BuildContext context) => buildItem(context);
}
