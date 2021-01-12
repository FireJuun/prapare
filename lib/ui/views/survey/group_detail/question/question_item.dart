import 'package:flutter/material.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

import 'question_items.dart';

abstract class QuestionItem {
  QuestionItem({@required this.group, @required this.question})
      : assert(group != null),
        assert(question != null);

  final ItemGroup group;
  final Question question;

  Widget buildQuestion(BuildContext context) => throw UnimplementedError();

  /// Look for subquestion values. If present, generate new views with these data
  /// A common example for these values is a 'prefer not to respond' subQuestion
  /// found within a text box, integer, or decimal [QuestionItemTextBox] widget
  static List<Widget> buildSubQuestions(ItemGroup group, Question question) =>
      (question.subQuestions.isNotEmpty)
          ? question.subQuestions
              .map((e) => QuestionItems(group: group, question: e))
              .toList()
          : [];
}
