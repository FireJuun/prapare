import 'package:flutter/material.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';
import 'package:prapare/models/fhir_questionnaire/survey/enums/qformat.dart';
import 'package:prapare/ui/views/survey/question/question_item_radio_button.dart';

import 'question_item_boolean.dart';
import 'question_item_checkbox.dart';
import 'question_item_text_box.dart';

class QuestionItems extends StatelessWidget {
  const QuestionItems({Key key, @required this.group, @required this.question})
      : super(key: key);

  final ItemGroup group;
  final Question question;

  @override
  Widget build(BuildContext context) {
    switch (question.format) {
      case QFormat.radio_button:
        return QuestionItemRadioButton(question: question, group: group);
      case QFormat.check_box:
        return QuestionItemCheckbox(question: question, group: group);
      case QFormat.text_box:
        return QuestionItemTextBox(question: question, group: group);
      // For now, boolean answer choices count as sliders
      case QFormat.slider:
        return QuestionItemBoolean(question: question, group: group);

      //todo: handle other question types
      default:
        return Container();
    }
  }
}
