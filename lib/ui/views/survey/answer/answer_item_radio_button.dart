import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/commands/commands.dart';
import 'package:prapare/controllers/controllers.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

import 'answer_title.dart';

class AnswerItemRadioButton extends StatelessWidget {
  const AnswerItemRadioButton(
      {Key key, @required this.answer, @required this.rxUserResponse})
      : super(key: key);

  final Answer answer;
  final Rx<UserResponse> rxUserResponse;

  @override
  Widget build(BuildContext context) {
    final UserResponsesController responsesController = Get.find();

    return Obx(() => RadioListTile<Rx<UserResponse>>(
          title: AnswerTitle(answer: answer),
          value: rxUserResponse,
          groupValue: responsesController
              .findActiveResponse(rxUserResponse.value.questionCode),
          toggleable: true,
          onChanged: (newResponse) async {
            ToggleRadioButtonCommand().execute(
                oldResponse: rxUserResponse, newResponse: newResponse.value);
          },
        ));
  }
}
