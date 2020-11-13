import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

import 'answer_title.dart';
import 'question_item_controller.dart';

class AnswerItemRadioButton extends StatelessWidget {
  const AnswerItemRadioButton(
      {Key key,
      @required this.survey,
      @required this.qIndex,
      @required this.ansIndex})
      : super(key: key);

  final Survey survey;
  final int qIndex;
  final int ansIndex;

  @override
  Widget build(BuildContext context) {
    final QuestionItemController controller = Get.find();
    final answer = survey.questions[qIndex].answers.elementAt(ansIndex);
    final userResponse =
        controller.qUserResponses.elementAt(qIndex).elementAt(ansIndex);

    return RadioListTile<UserResponse>(
      title: AnswerTitle(answer: answer),
      value: userResponse,
      groupValue: controller.activeResponse[qIndex],
      toggleable: true,
      onChanged: (newResponse) => controller.toggleRadioButtonCommand(
        oldResponse: userResponse,
        newResponse: newResponse,
        qIndex: qIndex,
      ),
    );
  }
}
