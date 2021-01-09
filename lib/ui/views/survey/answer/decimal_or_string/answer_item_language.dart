import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/ui/localization.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

import 'answer_item_decimal_or_string_controller.dart';
import 'answer_item_string.dart';

class AnswerItemLanguage extends AnswerItemString {
  const AnswerItemLanguage(
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
  // ***** to test: replace with _customRefresh() *****
  Widget buildTrailing(BuildContext context) => Container();

  // ignore: unused_element
  Widget _customRefresh(BuildContext context) {
    final labels = AppLocalizations.of(context);
    final AnswerItemDecimalOrStringController controller =
        Get.find(tag: answer.code);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Text(labels.language.update + ':'),
          IconButton(
              icon: const Icon(Icons.refresh),
              tooltip: labels.language.setPreferred,
              onPressed: () {
                controller.textEditingController.text = labels.language.title;
                controller.obj.value = labels.language.title;
              }),
        ],
      ),
    );
  }
}
