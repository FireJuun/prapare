import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/_internal/utils/utils.dart';
import 'package:prapare/localization.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';
import 'package:prapare/models/fhir_questionnaire/survey/enums/item_type.dart';
import 'package:prapare/ui/views/survey/answer/answer_item.dart';

import 'answer_item_decimal_or_string_controller.dart';

class AnswerItemDecimal extends StatelessWidget implements AnswerItem {
  const AnswerItemDecimal(
      {Key key,
      @required this.question,
      @required this.answer,
      @required this.userResponse})
      : assert(question != null),
        assert(answer != null),
        assert(userResponse != null),
        super(key: key);

  @override
  final Question question;
  @override
  final Answer answer;
  @override
  final Rx<UserResponse> userResponse;

  @override
  Widget buildAnswer(BuildContext context) {
    final labels = AppLocalizations.of(context);
    final bool _isAnswerAnInteger = answer.answerItemType == ItemType.integer;

    return GetX<AnswerItemDecimalOrStringController>(
      init: AnswerItemDecimalOrStringController(
          answer: answer, userResponse: userResponse),
      tag: answer.code,
      initState: (_) {},
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextFormField(
              controller: controller.textEditingController,
              onChanged: (newValue) => controller.obj.value = newValue,
              keyboardType:
                  TextInputType.numberWithOptions(decimal: !_isAnswerAnInteger),
              style: context.textTheme.bodyText2.apply(
                  decoration: controller.isQuestionDeclined().value
                      ? TextDecoration.lineThrough
                      : null),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: labels.prapare.instructions.number,
              ),
              validator: (String newValue) =>
                  ValidatorsUtil().validateNewAnswerValue(newValue, answer)),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) => buildAnswer(context);
}
