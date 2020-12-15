import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/localization.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

import 'answer_item_decimal.dart';
import 'answer_item_decimal_or_string_controller.dart';

class AnswerItemCurrency extends AnswerItemDecimal {
  const AnswerItemCurrency(
      {Key key,
      @required Question question,
      @required Answer answer,
      @required Rx<UserResponse> userResponse})
      : assert(question != null),
        assert(answer != null),
        assert(userResponse != null),
        super(
            key: key,
            question: question,
            answer: answer,
            userResponse: userResponse);

  @override
  Widget buildLeading(BuildContext context) {
    final labels = AppLocalizations.of(context);
    final AnswerItemDecimalOrStringController controller =
        Get.find(tag: answer.code);

    return Container();
  }
}
