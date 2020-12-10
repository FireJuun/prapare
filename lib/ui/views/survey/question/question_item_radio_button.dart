import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';
import 'package:prapare/ui/views/survey/answer/answer_items.dart';

import 'question_item.dart';
import 'question_item_radio_button_controller.dart';

class QuestionItemRadioButton extends StatelessWidget implements QuestionItem {
  const QuestionItemRadioButton({Key key, this.group, this.question})
      : super(key: key);

  @override
  final ItemGroup group;
  @override
  final Question question;

  @override
  Widget buildQuestion(BuildContext context) {
    final List<Answer> answerList = question.answers.toList();

    return GetBuilder<QuestionItemRadioButtonController>(
      init: QuestionItemRadioButtonController(group: group, question: question),
      initState: (_) {},
      tag: question.linkId,
      builder: (_) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...answerList.map(
              (answer) => AnswerItems(
                group: group,
                question: question,
                answer: answer,
              ),
            ),
            ...QuestionItem.buildSubQuestions(group, question),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) => buildQuestion(context);
}
