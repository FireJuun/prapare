import 'package:flutter/material.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

import 'question/question_item.dart';

class SurveyDetail extends StatelessWidget {
  const SurveyDetail({Key key, @required this.survey})
      : assert(survey != null),
        super(key: key);

  final Survey survey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        /// asMap().entries.map()...toList() used to pass index w/ map
        /// This is used to build each Question as its own QuestionItem widget
        children: survey.surveyItems
            .map((entry) => QuestionItem(survey: survey, question: entry))
            .toList(),
      ),
    );
  }
}
