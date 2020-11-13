import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/_internal/utils/prapare_codes_util.dart';
import 'package:prapare/controllers/controllers.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

import 'answer_title.dart';

class AnswerItem extends StatelessWidget {
  const AnswerItem(
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
    final UserResponsesController controller = Get.find();
    final PrapareCodesUtil codesUtil = PrapareCodesUtil();
    final answer = survey.questions[qIndex].answers.elementAt(ansIndex);

    try {
      switch (codesUtil
          .getAnswerTypeFromQuestionCode(survey.questions[qIndex].code)) {

        // **** Checkbox Answer ***
        case answerType.checkbox:
          final UserResponse _response = controller.findCheckboxResponse(
              survey: survey, qIndex: qIndex, ansIndex: ansIndex);

          return CheckboxListTile(
              title: AnswerTitle(answer: answer),
              value: _response.responseType.value,
              onChanged: (value) => controller.toggleChecked(_response));

        // **** DEFAULT: Radio Button Answer ***
        default:
          final _response = controller.findRadioButtonResponse(
              survey: survey, qIndex: qIndex);
          return RadioListTile<String>(
            title: AnswerTitle(answer: answer),
            value: _response.answerCode,
            groupValue: _response.answerCode,
            toggleable: true,
            onChanged: (String value) => controller,
          );
      }
    } catch (error) {
      return Container(child: Text(error.message));
    }
  }
}
