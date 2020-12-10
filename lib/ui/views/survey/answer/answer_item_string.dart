import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/_internal/utils/utils.dart';
import 'package:prapare/localization.dart';
import 'package:prapare/models/fhir_questionnaire/survey/enums/item_type.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

import 'answer_item.dart';
import 'answer_item_decimal_or_string_controller.dart';

class AnswerItemString extends StatelessWidget implements AnswerItem {
  const AnswerItemString({
    Key key,
    @required this.answer,
    @required this.rxUserResponse,
  })  : assert(answer != null),
        assert(rxUserResponse != null),
        super(key: key);

  @override
  final Answer answer;
  @override
  final Rx<UserResponse> rxUserResponse;

  @override
  Widget buildAnswer(BuildContext context) {
    final labels = AppLocalizations.of(context);
    // [AnswerText] accepts multi-line, whereas [AnswerString] prefers single
    final bool _isAnswerMultiLine = answer.answerItemType == ItemType.text;

    return GetX<AnswerItemDecimalOrStringController>(
      init: AnswerItemDecimalOrStringController(
          answer: answer, userResponse: rxUserResponse),
      // unique tag for this specific item
      tag: rxUserResponse.value.questionLinkId + answer.code,
      initState: (_) {},
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextFormField(
              controller: controller.textEditingController,
              onChanged: (newValue) => controller.obj.value = newValue,
              minLines: _isAnswerMultiLine ? 3 : 1,
              maxLines: _isAnswerMultiLine ? 6 : 1,
              style: context.textTheme.bodyText2.apply(
                  decoration: controller.isQuestionDeclined().value
                      ? TextDecoration.lineThrough
                      : null),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: labels.prapare.instructions.value,
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
