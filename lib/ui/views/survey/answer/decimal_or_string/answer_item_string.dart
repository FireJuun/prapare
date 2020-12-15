import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/_internal/utils/utils.dart';
import 'package:prapare/localization.dart';
import 'package:prapare/models/fhir_questionnaire/survey/enums/item_type.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

import '../answer_item.dart';
import 'answer_item_decimal_or_string_controller.dart';
import '../enable_when_option.dart';

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
            mainAxisSize: MainAxisSize.min,
            children: [
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
              // refresh icon for Q5, what language are you most comfortable speaking
              // (question.linkId == '/93043-8/54899-0')
              //     ? Padding(
              //         padding: const EdgeInsets.symmetric(horizontal: 16.0),
              //         child: Column(
              //           children: [
              //             Text(labels.language.update + ':'),
              //             IconButton(
              //                 icon: const Icon(Icons.refresh),
              //                 tooltip: labels.language.setPreferred,
              //                 onPressed: () {
              //                   controller.textEditingController.text =
              //                       labels.language.title;
              //                   controller.obj.value = labels.language.title;
              //                 }),
              //           ],
              //         ),
              //       )
              //     : Container(),
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
