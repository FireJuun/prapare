import 'package:flutter/material.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

import 'question/question_items.dart';
import 'question/question_title.dart';

class GroupDetail extends StatelessWidget {
  const GroupDetail({Key key, @required this.group})
      : assert(group != null),
        super(key: key);

  final ItemGroup group;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: group.surveyItems.map((entry) {
          // standard path for creating a question
          if (entry is Question) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // first, build question title
                QuestionTitle(questionLinkId: entry.linkId),
                QuestionItems(group: group, question: entry),
                const SizedBox(height: 16),
              ],
            );
          }
          // used for recursive questions, such as in Q14: '/93041-2/93031-3' in the past year...
          else if (entry is ItemGroup) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // first, build question title
                QuestionTitle(questionLinkId: entry.linkId),
                // todo: create separate layout for sub-questions
                GroupDetail(group: entry),
              ],
            );
          }
        }).toList(),
      ),
    );
  }
}
