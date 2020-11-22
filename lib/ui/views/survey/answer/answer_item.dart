import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/_internal/utils/item_type_util.dart';
import 'package:prapare/controllers/controllers.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';
import 'package:prapare/models/fhir_questionnaire/survey/item_type.dart';

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
    final ItemTypeUtil itemTypeUtil = ItemTypeUtil();
    final UserResponsesController controller = Get.find();
    final Rx<UserResponse> userResponse = controller.findRxUserResponse(
        questionLinkId: question.linkId, answerCode: answer.code);

    return AnswerItemRadioButton(
      answer: answer,
      rxUserResponse: userResponse,
    );

    //   try {
    //     switch (itemTypeUtil.getAnswerResponseType(answer)) {
    //       // **** Checkbox Answer ***
    //       //todo: fix checkbox handling...
    //       // case ItemType.choice:
    //       //   return AnswerItemCheckbox(
    //       //       answer: answer, rxUserResponse: userResponse);

    //       // **** Decimal Answers ***
    //       case ItemType.decimal:
    //         return AnswerItemDecimal(
    //             answer: answer, rxUserResponse: userResponse);
    //       case ItemType.integer:
    //         return AnswerItemDecimal(
    //             answer: answer, rxUserResponse: userResponse, isInteger: true);

    //       // **** String Answers ***
    //       case ItemType.string:
    //         return AnswerItemString(answer: answer, rxUserResponse: userResponse);
    //       case ItemType.text:
    //         // todo: handle answerText values
    //         return AnswerItemString(
    //             answer: answer, rxUserResponse: userResponse, isMultiLine: true);

    //       // **** DEFAULT: Radio Button Answer ***
    //       default:
    //         return AnswerItemRadioButton(
    //           answer: answer,
    //           rxUserResponse: userResponse,
    //         );
    //     }
    //   } catch (error) {
    //     return Container(child: Text(error.message));
    //   }
  }
}
