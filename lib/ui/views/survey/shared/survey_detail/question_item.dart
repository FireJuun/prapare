import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/_internal/utils/prapare_codes_util.dart';
import 'package:prapare/localization.dart';
import 'package:prapare/models/data/survey/export.dart';

import 'answer_item.dart';
import 'survey_detail_controller.dart';

class QuestionItem extends StatelessWidget {
  const QuestionItem(
      {Key key,
      @required this.survey,
      @required this.qIndex,
      @required this.question})
      : super(key: key);

  final Survey survey;
  final int qIndex;
  final Question question;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    final SurveyDetailController controller = Get.find();
    final PrapareCodesUtil codesUtil = PrapareCodesUtil();
    final AppLocalizations_Labels labels = AppLocalizations.of(context);

    /// Combine all questions, then get index number
    /// Note that this assumes each question / survey is unique
    final int qTotalIndex = controller.data.getTotalIndexFromQuestion(question);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Question title
        Text(
            '${qTotalIndex + 1}: ${codesUtil.getQuestionFromLinkIdAndLocale(question.code, labels)}',
            style: textTheme.headline6,
            textAlign: TextAlign.start),

        // todo: add handling of checkboxes and 'other' data entry
        /// All answers are mapped using spread operator
        /// toList() is required given answers are start as a set
        /// asMap().entries.map() are used to pass index w/ values
        ...question.answers.toList().asMap().entries.map(
              (entry) => AnswerItem(
                survey: survey,
                question: question,
                qIndex: qIndex,
                answer: entry.value,
                answerIndex: entry.key,
              ),
            ),
        // Extra padding at end
        const SizedBox(height: 16),
      ],
    );
  }
}
