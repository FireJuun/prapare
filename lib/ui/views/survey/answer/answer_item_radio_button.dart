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
    return GetX<UserResponsesController>(
      builder: (responsesController) {
        final rxActiveResponse = responsesController
            .findActiveResponse(rxUserResponse.value.questionLinkId);

        return RadioListTile<UserResponse>(
          title: AnswerTitle(answer: answer),
          value: rxUserResponse.value,
          groupValue: rxUserResponse.value,
          // value: rxUserResponse.value,
          // groupValue: rxActiveResponse.value,
          toggleable: true,
          onChanged: (newResponse) async {
            // await ToggleRadioButtonCommand()
            //     .execute(oldResponse: rxUserResponse, newResponse: newResponse);
          },
        );
      },
    );
  }
}
