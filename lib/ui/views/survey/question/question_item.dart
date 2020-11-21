import 'package:flutter/material.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';
import 'package:prapare/ui/views/survey/answer/answer_item.dart';

class QuestionItem extends StatelessWidget {
  const QuestionItem({Key key, @required this.group, @required this.question})
      : super(key: key);

  final ItemGroup group;
  final Question question;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...question.answers.toList().map(
              (entry) => AnswerItem(
                group: group,
                question: question,
                answer: entry,
              ),
            ),
        // Extra padding at end
        const SizedBox(height: 16),
      ],
    );
  }
}
