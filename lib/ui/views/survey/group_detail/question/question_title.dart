import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/_internal/utils/utils.dart';
import 'package:prapare/controllers/controllers.dart';
import 'package:prapare/ui/localization.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';
import 'package:prapare/ui/themes.dart';

class QuestionTitle extends StatelessWidget {
  const QuestionTitle({Key key, @required this.questionLinkId})
      : assert(questionLinkId != null),
        super(key: key);

  final String questionLinkId;

  @override
  Widget build(BuildContext context) {
    final AppTheme appTheme = Get.find<ThemeController>()
        .getAppThemeFromBrightness(context.theme.brightness);
    final TextTheme textTheme = context.textTheme;
    final QuestionnaireController controller = Get.find();
    final PrapareCodesUtil codesUtil = PrapareCodesUtil();
    final AppLocalizations_Labels labels = AppLocalizations.of(context);

    /// Combine all questions, then get index number
    /// Note that this assumes each question / survey is unique
    final int qTotalIndex =
        controller.getTotalIndexFromQuestion(questionLinkId);

    // if no qTotalIndex can be found, this is probably a subquestion, which is handled differently
    if (qTotalIndex == -1) {
      /// first, parse the last element of the question for display
      /// for now, we are assuming this is a coded answer
      final String parsedAnswerLinkId = LinkIdUtil().getLastId(questionLinkId);
      final String answerTitle =
          codesUtil.getAnswerFromLinkIdAndLocale(parsedAnswerLinkId, labels) ??
              '';

      return Padding(
        padding: const EdgeInsets.only(top: 16.0),

        /// SubQuestions with a DeclineToAnswer (LA30122-8) toggle
        /// are handled differently, since the Question Title
        /// would be the same as the Answer Title
        child: (parsedAnswerLinkId == 'LA30122-8')
            ? Container()
            : Text(answerTitle,
                style: textTheme.bodyText1, textAlign: TextAlign.start),
      );
    } else {
      // Default path: Question Title
      final String questionTitle =
          codesUtil.getQuestionFromLinkIdAndLocale(questionLinkId, labels) ??
              '';
      final ValidationController validationController = Get.find();
      final String groupAndQuestionId =
          LinkIdUtil().getGroupAndQuestionId(questionLinkId);
      final QuestionValidators qValidators =
          validationController.questionValidatorsMap[groupAndQuestionId];

      return Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
              (qValidators.isQuestionAnswered.value ? '✓ ' : '') +
                  '${qTotalIndex + 1}: ' +
                  questionTitle,
              style: textTheme.headline6.apply(
                  // question is answered: bold, color change
                  color: qValidators.isQuestionAnswered.value
                      ? appTheme.textComplete
                      : null,
                  fontWeightDelta: qValidators.isQuestionAnswered.value ? 2 : 0,
                  // question is declined: italic, linethrough
                  fontStyle: qValidators.isQuestionDeclined.value
                      ? FontStyle.italic
                      : null,
                  decoration: qValidators.isQuestionDeclined.value
                      ? TextDecoration.lineThrough
                      : null),
              textAlign: TextAlign.start),
        ),
      );
    }
  }
}
