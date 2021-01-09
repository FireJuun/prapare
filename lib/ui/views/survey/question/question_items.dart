import 'package:flutter/material.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';
import 'package:prapare/_internal/enums/qformat_enum.dart';

import 'question_item_default.dart';
import 'question_item_radio_button.dart';

class QuestionItems extends StatelessWidget {
  const QuestionItems({Key key, @required this.group, @required this.question})
      : super(key: key);

  final ItemGroup group;
  final Question question;

  @override
  Widget build(BuildContext context) {
    switch (question.format) {

      /// Stateful Question Items
      case QFormat.radio_button:
        return QuestionItemRadioButton(question: question, group: group);

      /// Stateless Question Items
      /// For now, boolean answer choices count as sliders
      /// currently, this is only used for subquestions with booleans
      /// (Question #14, choose not to respond)
      case QFormat.check_box:
      case QFormat.slider:
      case QFormat.text_box:
        return QuestionItemDefault(question: question, group: group);

      // todo: handle other question types
      default:
        return Container();
    }
  }
}
