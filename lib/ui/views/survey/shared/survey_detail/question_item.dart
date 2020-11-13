import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/_internal/utils/prapare_codes_util.dart';
import 'package:prapare/controllers/controllers.dart';
import 'package:prapare/localization.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

import 'answer_item.dart';
import 'question_item_controller.dart';

class QuestionItem extends StatelessWidget {
  const QuestionItem({Key key, @required this.survey, @required this.qIndex})
      : super(key: key);

  final Survey survey;
  final int qIndex;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    final QuestionnaireController controller = Get.find();
    final PrapareCodesUtil codesUtil = PrapareCodesUtil();
    final AppLocalizations_Labels labels = AppLocalizations.of(context);

    final Question question = survey.questions[qIndex];

    /// Combine all questions, then get index number
    /// Note that this assumes each question / survey is unique
    final int qTotalIndex = controller.getTotalIndexFromQuestion(question);

    return GetBuilder<QuestionItemController>(
      init: QuestionItemController(survey: survey),
      builder: (_) {
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
                    qIndex: qIndex,
                    ansIndex: entry.key,
                  ),
                ),
            // Extra padding at end
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }
}
