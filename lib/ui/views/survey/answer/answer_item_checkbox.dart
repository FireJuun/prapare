import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/commands/commands.dart';
import 'package:prapare/controllers/controllers.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

import 'answer_title.dart';

class AnswerItemCheckbox extends StatefulWidget {
  const AnswerItemCheckbox(
      {Key key, @required this.answer, @required this.rxUserResponse})
      : super(key: key);

  final Answer answer;
  final Rx<UserResponse> rxUserResponse;

  @override
  _AnswerItemCheckboxState createState() => _AnswerItemCheckboxState();
}

class _AnswerItemCheckboxState extends State<AnswerItemCheckbox> {
  final UserResponsesController controller = Get.find();

  final RxBool activeBool = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CheckboxListTile(
        title: AnswerTitle(answer: widget.answer),
        value: activeBool.value,
        onChanged: (newValue) async {
          // close keyboard if previously open:
          FocusScope.of(context).unfocus();
          // then toggle checkbox
          ToggleCheckboxCommand().execute(
              userResponse: widget.rxUserResponse,
              answer: widget.answer,
              newValue: newValue);
          activeBool.value = newValue;
        },
      ),
    );
  }

  @override
  void initState() {
    // returns most recent value, otherwise the default '' remains
    activeBool.value = controller.getCheckboxValueFromUserResponseAndAnswer(
        answer: widget.answer, userResponse: widget.rxUserResponse);
    super.initState();
  }
}
