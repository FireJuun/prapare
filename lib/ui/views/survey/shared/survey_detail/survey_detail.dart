import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/models/data/survey/export.dart';
import 'package:prapare/ui/views/survey/shared/survey_detail/survey_detail_controller.dart';

import 'question_item.dart';

class SurveyDetail extends StatelessWidget {
  const SurveyDetail({Key key, @required this.survey})
      : assert(survey != null),
        super(key: key);

  final Survey survey;

  @override
  Widget build(BuildContext context) {
    // for now, using GetBuilder instead of GetX so that update() calls in the controller will trigger a redraw of the UI
    return GetBuilder<SurveyDetailController>(
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            /// asMap().map()...values.toList() used to pass index w/ map
            /// spec: https://fireship.io/snippets/dart-how-to-get-the-index-on-array-loop-map/
            children: survey.questions
                .asMap()
                .map((index, question) => MapEntry(
                    index,
                    QuestionItem(
                        survey: survey, qIndex: index, question: question)))
                .values
                .toList(),
          ),
        );
      },
    );
  }
}
