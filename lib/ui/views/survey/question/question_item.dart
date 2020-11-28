import 'package:flutter/material.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

abstract class QuestionItem {
  QuestionItem({@required this.group, @required this.question})
      : assert(group != null),
        assert(question != null);

  final ItemGroup group;
  final Question question;

  Widget buildQuestion(BuildContext context) => throw UnimplementedError();
}
