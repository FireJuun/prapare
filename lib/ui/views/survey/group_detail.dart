import 'package:flutter/material.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

import 'question/question_item.dart';

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

        /// asMap().entries.map()...toList() used to pass index w/ map
        /// This is used to build each Question as its own QuestionItem widget
        children: group.surveyItems
            .map((entry) => QuestionItem(group: group, question: entry))
            .toList(),
      ),
    );
  }
}
