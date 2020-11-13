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
      @required this.survey,
      @required this.question,
      @required this.answer})
      : super(key: key);

  final Survey survey;
  final Question question;
  final Answer answer;

  @override
  Widget build(BuildContext context) {
    final PrapareCodesUtil codesUtil = PrapareCodesUtil();
    final UserResponsesController controller = Get.find();
    final UserResponse userResponse = controller.findUserResponse(
        surveyCode: survey.code,
        questionCode: question.code,
        answerCode: answer.code);

    try {
      switch (codesUtil.getAnswerTypeFromQuestionCode(question.code)) {
        // **** Checkbox Answer ***
        case answerType.checkbox:
          return AnswerItemCheckbox(answer: answer, userResponse: userResponse);

        // **** DEFAULT: Radio Button Answer ***
        default:
          return AnswerItemRadioButton(
            answer: answer,
            userResponse: userResponse,
          );
      }
    } catch (error) {
      return Container(child: Text(error.message));
    }
  }
}
