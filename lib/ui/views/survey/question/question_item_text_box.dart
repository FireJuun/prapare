import 'package:flutter/material.dart';
import 'package:prapare/_internal/utils/item_type_util.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';
import 'package:prapare/ui/views/survey/answer/answer_items.dart';

import 'question_item.dart';

class QuestionItemTextBox extends StatelessWidget implements QuestionItem {
  const QuestionItemTextBox(
      {Key key, @required this.group, @required this.question})
      : super(key: key);

  @override
  final ItemGroup group;
  @override
  final Question question;

  @override
  Widget buildQuestion(BuildContext context) {
    /// ItemType and QuestionnaireItemType need to be parsed
    /// to remove the 'QuestionnaireItemType.___' and return '___'
    final String _qItemType =
        ItemTypeUtil().getCodeFromQuestionnaireItemType(question.itemType) ??
            '';
    final Answer _answer =
        question.answers.firstWhere((element) => element.code == _qItemType);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnswerItems(
          group: group,
          question: question,
          answer: _answer,
        ),
        ...QuestionItem.buildSubQuestions(group, question),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => buildQuestion(context);
}
