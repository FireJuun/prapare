import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/_internal/utils/utils.dart';
import 'package:prapare/controllers/controllers.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';
import 'package:prapare/models/fhir_questionnaire/survey/enums/item_type.dart';
import 'package:prapare/models/fhir_questionnaire/survey/enums/qformat.dart';
import 'package:prapare/ui/views/survey/answer/answer_item_decline_to_answer.dart';

import 'answer_item_checkbox.dart';
import 'answer_item_decimal.dart';
import 'answer_item_radio_button.dart';
import 'answer_item_string.dart';

class AnswerItems extends StatelessWidget {
  const AnswerItems({
    Key key,
    @required this.group,
    @required this.question,
    @required this.answer,
    this.activeCode,
  }) : super(key: key);

  final ItemGroup group;
  final Question question;
  final Answer answer;
  final RxString activeCode;

  @override
  Widget build(BuildContext context) {
    final UserResponsesController controller = Get.find();
    final Rx<UserResponse> userResponse =
        controller.findActiveResponse(question.linkId);

    try {
      final lastAnswerCode = LinkIdUtil().getLastId(answer.code);

      /// First, check to see if answer code has unique/custom view
      /// These answers have their views determined programmatically, regardless of overall question type
      switch (lastAnswerCode) {
        // LA30122-8: I choose not to answer this question
        case 'LA30122-8':
          return AnswerItemDeclineToAnswer(
              answer: answer, rxUserResponse: userResponse);
        //  LA46-8:  labels.prapare.answers.other;
        // case 'LA46-8':
        //   return const Text('other');
        //  'LA30137-6':  labels.prapare.answers.work.otherwiseUnemployedButNotSeekingWork;
        // case 'LA30137-6':
        //   return const Text('Otherwise Unemployed But Not Seeking Work');
      }

      // Otherwise, build view based on answerItemType
      switch (answer.answerItemType) {
        // **** Radio Buttons + Checkbox Answers ***
        case ItemType.open_choice:
        // todo: separate handling of open-choice?
        // the 'enableWhen' flag may satisfy some of this
        case ItemType.choice:
          {
            if (question.format == QFormat.radio_button) {
              return AnswerItemRadioButton(
                  answer: answer,
                  rxUserResponse: userResponse,
                  activeCode: activeCode);
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

        case ItemType.boolean:
          // todo: implement answer_boolean
          return const Text('boolean');

        // **** DEFAULT: Radio Button Answer ***
        default:
          return Container();
      }
    } catch (error) {
      return Container(child: Text(error.message));
    }
  }
}
