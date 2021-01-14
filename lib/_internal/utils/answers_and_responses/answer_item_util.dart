import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/_internal/enums/item_type_enum.dart';
import 'package:prapare/_internal/enums/qformat_enum.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';
import 'package:prapare/ui/views/survey/group_detail/answer/choice_or_open_choice/answer_item_checkbox.dart';
import 'package:prapare/ui/views/survey/group_detail/answer/decimal_or_string/answer_item_decimal.dart';
import 'package:prapare/ui/views/survey/group_detail/answer/choice_or_open_choice/answer_item_radio_button.dart';
import 'package:prapare/ui/views/survey/group_detail/answer/decimal_or_string/answer_item_string.dart';

class AnswerItemUtil {
  Widget buildAnswerWidgetByItemType(
      Question question, Answer answer, Rx<UserResponse> userResponse) {
    switch (answer.answerItemType) {
      // **** Radio Buttons + Checkbox Answers ***
      case ItemType.open_choice:
      // todo: separate handling of open-choice?
      // the 'enableWhen' flag may satisfy some of this
      case ItemType.choice:
        {
          if (question.format == QFormat.radio_button) {
            return AnswerItemRadioButton(
                question: question, answer: answer, userResponse: userResponse);
          } else if (question.format == QFormat.check_box) {
            return AnswerItemCheckbox(
                question: question, answer: answer, userResponse: userResponse);
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
            question: question, answer: answer, userResponse: userResponse);

      // **** String Answers ***
      case ItemType.string:
      case ItemType.text:
        return AnswerItemString(
            question: question, answer: answer, userResponse: userResponse);

      case ItemType.boolean:
        // todo: implement answer_boolean
        return const Text('boolean');

      // **** DEFAULT: Radio Button Answer ***
      default:
        return Container();
    }
  }
}
