import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:prapare/_internal/utils/utils.dart';
import 'package:prapare/ui/localization.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';
import 'package:prapare/_internal/enums/item_type_enum.dart';
import 'package:prapare/ui/views/survey/group_detail/answer/answer_item.dart';

import '../enable_when_option.dart';
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

  Widget buildLeading(BuildContext context) => Container();
  Widget buildTrailing(BuildContext context) => Container();

  Widget buildTextFormField(BuildContext context) {
    final AnswerItemDecimalOrStringController controller =
        Get.find(tag: answer.code);
    final labels = AppLocalizations.of(context);
    final bool _isAnswerAnInteger = answer.answerItemType == ItemType.integer;

    return TextFormField(
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
        labelText: labels.validation.instructions.number,
      ),
      validator: (String newValue) =>
          ValidatorsUtil().isNewAnswerValueValid(newValue, answer)
              ? null
              : labels.validation.error,
    );
  }

  @override
  Widget buildAnswer(BuildContext context) {
    return GetX<AnswerItemDecimalOrStringController>(
      init: AnswerItemDecimalOrStringController(
          answer: answer, userResponse: userResponse),
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
                  child: buildTextFormField(context),
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
