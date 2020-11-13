import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/fhir_questionnaire/questionnaire_controller.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

import 'answer_title.dart';
import 'question_item_controller.dart';

class AnswerItemCheckbox extends StatelessWidget {
  const AnswerItemCheckbox(
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

    return CheckboxListTile(
        title: AnswerTitle(answer: answer),
        value: userResponse.responseType.value,
        onChanged: (newValue) =>
            controller.toggleCheckboxCommand(userResponse: userResponse));
  }
}
