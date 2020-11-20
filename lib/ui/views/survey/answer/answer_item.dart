import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/_internal/utils/prapare_codes_util.dart';
import 'package:prapare/controllers/controllers.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

import 'answer_item_checkbox.dart';
import 'answer_item_decimal.dart';
import 'answer_item_radio_button.dart';
import 'answer_item_string.dart';

class AnswerItem extends StatelessWidget {
  const AnswerItem(
      {Key key,
      @required this.group,
      @required this.question,
      @required this.answer})
      : super(key: key);

  final ItemGroup group;
  final Question question;
  final Answer answer;

  @override
  Widget build(BuildContext context) {
    final PrapareCodesUtil codesUtil = PrapareCodesUtil();
    final UserResponsesController controller = Get.find();
    final Rx<UserResponse> userResponse = controller.findRxUserResponse(
        questionLinkId: question.linkId, answerCode: answer.code);

    try {
      switch (codesUtil.getAnswerTypeFromQuestionCode(question.linkId)) {
        // **** Checkbox Answer ***
        case answerType.checkbox:
          return AnswerItemCheckbox(
              answer: answer, rxUserResponse: userResponse);

        // **** Decimal Answers ***
        case answerType.decimal:
          return AnswerItemDecimal(
              answer: answer, rxUserResponse: userResponse);
        case answerType.decimal_int:
          return AnswerItemDecimal(
              answer: answer, rxUserResponse: userResponse, isInteger: true);

        // **** String Answers ***
        case answerType.string:
          return AnswerItemString(answer: answer, rxUserResponse: userResponse);
        case answerType.string_long:
          return AnswerItemString(
              answer: answer, rxUserResponse: userResponse, isMultiLine: true);

        // **** DEFAULT: Radio Button Answer ***
        default:
          return AnswerItemRadioButton(
            answer: answer,
            rxUserResponse: userResponse,
          );
      }
    } catch (error) {
      return Container(child: Text(error.message));
    }
  }
}
