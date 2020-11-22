import 'package:flutter/material.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';
import 'package:prapare/models/fhir_questionnaire/survey/item_type.dart';
import 'package:prapare/models/fhir_questionnaire/survey/qformat.dart';
import 'package:prapare/ui/views/survey/answer/answer_item.dart';

class QuestionItem extends StatelessWidget {
  const QuestionItem({Key key, @required this.group, @required this.question})
      : super(key: key);

  final ItemGroup group;
  final Question question;

  @override
  Widget build(BuildContext context) {
    List<Widget> _buildAnswerItemList() {
      final List<Widget> answerItemList = <Widget>[];
      switch (question.format) {
        case QFormat.radio_button:
        case QFormat.check_box:
          {
            question.answers.toList().map(
                  (entry) => answerItemList.add(
                    AnswerItem(
                      group: group,
                      question: question,
                      answer: entry,
                    ),
                  ),
                );
            break;
          }
        case QFormat.text_box:
          {
            final Answer _answer = question.answers
                .firstWhere((element) => element.code == 'string');
            // answerItemList.add(const Text('text'));
            answerItemList.add(AnswerItem(
              group: group,
              question: question,
              // todo: handle more than just string values
              answer: _answer,
            ));
            break;
          }
        default:
      }
      answerItemList.add(const SizedBox(height: 16));
      return answerItemList;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _buildAnswerItemList(),
    );
  }
}
