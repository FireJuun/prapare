import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/_internal/utils/prapare_codes_util.dart';
import 'package:prapare/controllers/controllers.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

import 'answer_item_checkbox.dart';
import 'answer_item_radio_button.dart';

class AnswerItem extends StatelessWidget {
  const AnswerItem(
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
    final PrapareCodesUtil codesUtil = PrapareCodesUtil();
    final QuestionnaireController _questionnaireController = Get.find();

    final Survey survey = _questionnaireController.getSurveyFromIndex(sIndex);

    try {
      switch (codesUtil
          .getAnswerTypeFromQuestionCode(survey.questions[qIndex].code)) {

        // **** Checkbox Answer ***
        case answerType.checkbox:
          return AnswerItemCheckbox(
              sIndex: sIndex, qIndex: qIndex, ansIndex: ansIndex);

        // **** DEFAULT: Radio Button Answer ***
        default:
          return AnswerItemRadioButton(
              sIndex: sIndex, qIndex: qIndex, ansIndex: ansIndex);
      }
    } catch (error) {
      return Container(child: Text(error.message));
    }
  }
}
