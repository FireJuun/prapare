import 'package:flutter/material.dart';
import 'package:prapare/_internal/utils/item_type_util.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';
import 'package:prapare/ui/views/survey/answer/answer_item.dart';

class QuestionItemTextBox extends StatelessWidget {
  const QuestionItemTextBox(
      {Key key, @required this.group, @required this.question})
      : super(key: key);

  final ItemGroup group;
  final Question question;

  @override
  Widget build(BuildContext context) {
    /// ItemType and QuestionnaireItemType need to be parsed
    /// to remove the 'QuestionnaireItemType.___' and return '___'
    final String _qItemType =
        ItemTypeUtil().getCodeFromQuestionnaireItemType(question.itemType);
    final Answer _answer =
        question.answers.firstWhere((element) => element.code == _qItemType);
    return AnswerItem(
      group: group,
      question: question,
      answer: _answer,
    );
  }
}
