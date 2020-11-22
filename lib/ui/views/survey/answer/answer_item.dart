import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/controllers.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';
import 'package:prapare/models/fhir_questionnaire/survey/item_type.dart';
import 'package:prapare/models/fhir_questionnaire/survey/qformat.dart';

import 'answer_item_checkbox.dart';
import 'answer_item_decimal.dart';
import 'answer_item_radio_button.dart';
import 'answer_item_string.dart';

class AnswerItem extends StatelessWidget {
  const AnswerItem(
      {Key key,
      @required this.group,
      @required this.question,
      @required this.answer,
      this.activeCode})
      : super(key: key);

  final ItemGroup group;
  final Question question;
  final Answer answer;
  final RxString activeCode;

  @override
  Widget build(BuildContext context) {
    final UserResponsesController controller = Get.find();
    final Rx<UserResponse> userResponse = controller.findRxUserResponse(
        questionLinkId: question.linkId, answerCode: answer.code);

    try {
      switch (answer.answerItemType) {
        // **** Radio Buttons + Checkbox Answers ***
        case ItemType.choice:
        // todo: separate handling of open-choice
        case ItemType.open_choice:
          {
            if (question.format == QFormat.radio_button) {
              return AnswerItemRadioButton(
                answer: answer,
                rxUserResponse: userResponse,
                activeCode: activeCode ?? ''.obs,
              );
            } else if (question.format == QFormat.check_box) {
              return AnswerItemCheckbox(
                  answer: answer, rxUserResponse: userResponse);
            }
            // otherwise, return error
            return Container(
              child: Text(
                  'error: ${answer.answerItemType} does not know how to handle ${question.format}'),
            );
          }

        // **** Number Answers ***
        case ItemType.decimal:
        case ItemType.integer:
          return AnswerItemDecimal(
              answer: answer, rxUserResponse: userResponse);

        // **** String Answers ***
        case ItemType.string:
        case ItemType.text:
          return AnswerItemString(answer: answer, rxUserResponse: userResponse);

        // **** DEFAULT: Radio Button Answer ***
        default:
          return Container();
      }
    } catch (error) {
      return Container(child: Text(error.message));
    }
  }
}
