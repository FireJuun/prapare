import 'package:flutter/material.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';
import 'package:prapare/ui/views/survey/answer/answer_items.dart';

import 'question_item.dart';

class QuestionItemCheckbox extends StatelessWidget implements QuestionItem {
  const QuestionItemCheckbox({Key key, this.group, this.question})
      : super(key: key);

  @override
  final ItemGroup group;
  @override
  final Question question;

  @override
  Widget buildQuestion(BuildContext context) {
    final List<Answer> answerList = question.answers.toList();

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
      ],
    );
  }

  @override
  Widget build(BuildContext context) => buildQuestion(context);
}
