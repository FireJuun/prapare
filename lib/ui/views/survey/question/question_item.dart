import 'package:flutter/material.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';
import 'package:prapare/models/fhir_questionnaire/survey/qformat.dart';
import 'package:prapare/ui/views/survey/question/question_item_radio_button.dart';

import 'question_item_checkbox.dart';
import 'question_item_text_box.dart';

class QuestionItem extends StatelessWidget {
  const QuestionItem({Key key, @required this.group, @required this.question})
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

      //todo: handle other question types
      default:
        return Container();
    }
  }
}
// List<Widget> _buildAnswerItemList(ItemGroup group, Question question) {
//   /// Since one question may have multiple item options (e.g. list, text box, etc),
//   /// The method to create AnswerItems was extracted
//   /// Each AnswerItem is self-aware, so it should still show its own layout correctly
//   final List<Widget> answerItemList = [];
//   switch (question.format) {
//     case QFormat.radio_button:
//     case QFormat.check_box:
//       {
//         final List<Answer> _newAnswers = question.answers.toList();
//         _newAnswers.forEach(
//           (entry) {
//             answerItemList.add(
//               AnswerItem(
//                 group: group,
//                 question: question,
//                 answer: entry,
//               ),
//             );
//           },
//         );
//         break;
//       }

//     /// For now, text_box items assume no Answer exists, so it creates a new AnswerItem based on its type
//     /// todo: add ability for these items to search for their own subquestions
//     case QFormat.text_box:
//       {
//         /// ItemType and QuestionnaireItemType need to be parsed
//         /// to remove the 'QuestionnaireItemType.___' and return '___'
//         final String _qItemType =
//             ItemTypeUtil().getCodeFromQuestionnaireItemType(question.itemType);
//         final Answer _answer = question.answers
//             .firstWhere((element) => element.code == _qItemType);
//         answerItemList.add(AnswerItem(
//           group: group,
//           question: question,
//           answer: _answer,
//         ));
//         break;
//       }
//     default:
//   }
//   answerItemList.add(const SizedBox(height: 16));
//   return answerItemList;
// }
