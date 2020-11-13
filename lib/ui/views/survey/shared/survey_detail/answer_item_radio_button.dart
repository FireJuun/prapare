import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/controllers.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

import 'answer_item_radio_button_controller.dart';
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
    final UserResponsesController responsesController = Get.find();

    return GetX<AnswerItemRadioButtonController>(
      init: AnswerItemRadioButtonController(),
      initState: (_) {},
      builder: (_) {
        _.rxUserResponse = userResponse;
        return RadioListTile<UserResponse>(
          title: AnswerTitle(answer: answer),
          value: _.rxUserResponse,
          groupValue:
              responsesController.findActiveResponse(userResponse.questionCode),
          toggleable: true,
          onChanged: (newResponse) {
            controller.toggleRadioButtonCommand(
                oldResponse: userResponse, newResponse: newResponse);
            _.rxUserResponse = newResponse;
          },
        );
      },
    );
  }
}
