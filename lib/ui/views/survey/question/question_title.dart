import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/_internal/utils/prapare_codes_util.dart';
import 'package:prapare/controllers/controllers.dart';
import 'package:prapare/localization.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

class QuestionTitle extends StatelessWidget {
  const QuestionTitle({Key key, @required this.question})
      : assert(question != null),
        super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    final QuestionnaireController controller = Get.find();
    final PrapareCodesUtil codesUtil = PrapareCodesUtil();
    final AppLocalizations_Labels labels = AppLocalizations.of(context);

    /// Combine all questions, then get index number
    /// Note that this assumes each question / survey is unique
    final int qTotalIndex = controller.getTotalIndexFromQuestion(question);

    return // Question title
        Text(
            '${qTotalIndex + 1}: ${codesUtil.getQuestionFromLinkIdAndLocale(question.linkId, labels)}',
            style: textTheme.headline6,
            textAlign: TextAlign.start);
  }
}
