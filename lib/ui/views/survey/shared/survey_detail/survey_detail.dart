import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/_internal/utils/prapare_codes_util.dart';
import 'package:prapare/localization.dart';
import 'package:prapare/models/data/survey/question.dart';
import 'package:prapare/models/data/survey/survey.dart';
import 'package:prapare/ui/views/survey/shared/survey_detail/survey_detail_controller.dart';

import 'answer_item.dart';

class SurveyDetail extends StatelessWidget {
  const SurveyDetail(
      {Key key, @required this.surveyCode, @required this.tabIndex})
      : assert(surveyCode != null),
        super(key: key);

  final String surveyCode;
  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    // for now, using GetBuilder instead of GetX so that update() calls in the controller will trigger a redraw of the UI
    return GetBuilder<SurveyDetailController>(
      builder: (controller) {
        final TextTheme textTheme = context.textTheme;
        final Survey survey = controller.data.getSurveyFromCode(surveyCode);
        final PrapareCodesUtil codesUtil = PrapareCodesUtil();
        final AppLocalizations_Labels labels = AppLocalizations.of(context);

        Widget mapQuestion(int qIndex, Question question) {
          /// Combine all questions, then get index number
          /// Note that this assumems each question / survey is unique
          final int qTotalIndex =
              controller.data.getTotalIndexFromQuestion(question);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Question title
              Text(
                  '${qTotalIndex + 1}: ${codesUtil.getQuestionFromLinkIdAndLocale(question.code, labels)}',
                  style: textTheme.headline6,
                  textAlign: TextAlign.start),

              // All answers are mapped out using spread operator
              // todo: add handling of checkboxes and 'other' data entry
              ...question.answers.toList().asMap().entries.map(
                    (answer) => AnswerItem(
                      survey: survey,
                      question: question,
                      qIndex: qIndex,
                      answer: answer.value,
                      answerIndex: answer.key,
                    ),
                  ),
              // Extra padding at end
              const SizedBox(height: 16),
            ],
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            /// asMap().map()...values.toList() used to pass index w/ map
            /// spec: https://fireship.io/snippets/dart-how-to-get-the-index-on-array-loop-map/
            children: survey.questions
                .asMap()
                .map((index, question) =>
                    MapEntry(index, mapQuestion(index, question)))
                .values
                .toList(),
          ),
        );
      },
    );
  }
}
