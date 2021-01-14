import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/_internal/utils/utils.dart';
import 'package:prapare/controllers/controllers.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';
import 'package:prapare/ui/views/survey/group_detail/answer/boolean/answer_item_decline_to_answer.dart';
import 'package:prapare/ui/views/survey/group_detail/answer/decimal_or_string/answer_item_language.dart';

import 'decimal_or_string/answer_item_currency.dart';

class AnswerItems extends StatelessWidget {
  const AnswerItems({
    Key key,
    @required this.group,
    @required this.question,
    @required this.answer,
  }) : super(key: key);

  final ItemGroup group;
  final Question question;
  final Answer answer;

  @override
  Widget build(BuildContext context) {
    final UserResponsesController controller = Get.find();
    final Rx<UserResponse> userResponse =
        controller.findActiveResponse(question.linkId);
    final ValidationController validationController = Get.find();

    try {
      final lastAnswerCode = LinkIdUtil().getLastId(answer.code);

      /// First, check to see if answer code has unique/custom view
      /// These answers have their views determined programmatically, regardless of overall question type
      switch (lastAnswerCode) {

        /// LA30122-8: Choose not to answer
        /// type: boolean
        case 'LA30122-8':
          return AnswerItemDeclineToAnswer(
              question: question, answer: answer, userResponse: userResponse);

        /// 54899-0: Preferred Language
        /// type: string -> string
        case '54899-0':
          return AnswerItemLanguage(
              question: question, answer: answer, userResponse: userResponse);

        /// 63586-2: Total Combined Income
        /// type: decimal -> double
        case '63586-2':
          return AnswerItemCurrency(
              question: question, answer: answer, userResponse: userResponse);
      }

      // enableWhen targets are displayed inside the relevant enableWhen Answer, not in a nested column
      if (validationController.isAnswerAnEnableWhenTarget(question, answer)) {
        return Container();
      }

      // Otherwise, build view based on answerItemType
      return AnswerItemUtil()
          .buildAnswerWidgetByItemType(question, answer, userResponse);
    } catch (error) {
      return Container(child: Text(error.message));
    }
  }
}
