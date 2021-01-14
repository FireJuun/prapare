import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/_internal/utils/utils.dart';
import 'package:prapare/ui/localization.dart';
import 'package:prapare/_internal/enums/item_type_enum.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

import '../answer_item.dart';
import '../enable_when_option.dart';
import 'answer_item_decimal_or_string_controller.dart';

class AnswerItemString extends StatelessWidget implements AnswerItem {
  const AnswerItemString(
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

  Widget buildLeading(BuildContext context) => Container();
  Widget buildTrailing(BuildContext context) => Container();

  @override
  Widget buildAnswer(BuildContext context) {
    final labels = AppLocalizations.of(context);
    // [AnswerText] accepts multi-line, whereas [AnswerString] prefers single
    final bool _isAnswerMultiLine = answer.answerItemType == ItemType.text;

    return GetX<AnswerItemDecimalOrStringController>(
      init: AnswerItemDecimalOrStringController(
          answer: answer, userResponse: userResponse),
      // unique tag for this specific item
      tag: answer.code,
      initState: (_) {},
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              buildLeading(context),
              Expanded(
                child: FocusableActionDetector(
                  onFocusChange: (newValue) => controller.changeFocus(newValue),
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
                      labelText: labels.validation.instructions.value,
                    ),
                    validator: (String newValue) =>
                        ValidatorsUtil().isNewAnswerValueValid(newValue, answer)
                            ? null
                            : labels.validation.error,
                  ),
                ),
              ),
              buildTrailing(context),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget buildAnswerAndEnableWhenOption(BuildContext context) =>
      EnableWhenOption(
        question: question,
        answer: answer,
        userResponse: userResponse,
        answerItemWidget: buildAnswer(context),
      );

  @override
  Widget build(BuildContext context) => buildAnswerAndEnableWhenOption(context);
}
