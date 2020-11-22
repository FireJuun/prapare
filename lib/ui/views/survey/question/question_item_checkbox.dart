import 'package:flutter/material.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';
import 'package:prapare/ui/views/survey/answer/answer_item.dart';

class QuestionItemCheckbox extends StatelessWidget {
  const QuestionItemCheckbox({Key key, this.group, this.question})
      : super(key: key);

  final ItemGroup group;
  final Question question;

  @override
  Widget build(BuildContext context) {
    final List<Answer> answerList = question.answers.toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...answerList.map(
          (answer) => AnswerItem(
            group: group,
            question: question,
            answer: answer,
          ),
        ),
      ],
    );
  }
}
