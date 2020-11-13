import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/controllers.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

import 'answer_title.dart';
import 'question_item_controller.dart';

class AnswerItemRadioButton extends StatelessWidget {
  const AnswerItemRadioButton(
      {Key key,
      @required this.sIndex,
      @required this.qIndex,
      @required this.ansIndex})
      : super(key: key);

  final int sIndex;
  final int qIndex;
  final int ansIndex;

  @override
  Widget build(BuildContext context) {
    final QuestionItemController controller = Get.find();
    final QuestionnaireController _questionnaireController = Get.find();

    final Survey survey = _questionnaireController.getSurveyFromIndex(sIndex);
    final Answer answer = survey.questions[qIndex].answers.elementAt(ansIndex);
    final UserResponse userResponse = controller.qUserResponses
        .elementAt(sIndex)
        .elementAt(qIndex)
        .elementAt(ansIndex);

    return RadioListTile<UserResponse>(
      title: AnswerTitle(answer: answer),
      value: userResponse,
      groupValue: controller.activeResponse[sIndex][qIndex],
      toggleable: true,
      onChanged: (newResponse) => controller.toggleRadioButtonCommand(
        oldResponse: userResponse,
        newResponse: newResponse,
        sIndex: sIndex,
        qIndex: qIndex,
      ),
    );
  }
}
