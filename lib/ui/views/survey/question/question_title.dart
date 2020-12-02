import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/_internal/utils/prapare_codes_util.dart';
import 'package:prapare/_internal/utils/utils.dart';
import 'package:prapare/controllers/controllers.dart';
import 'package:prapare/localization.dart';

class QuestionTitle extends StatelessWidget {
  const QuestionTitle({Key key, @required this.questionLinkId})
      : assert(questionLinkId != null),
        super(key: key);

  final String questionLinkId;

  @override
  Widget build(BuildContext context) {
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
      final String questionTitle =
          codesUtil.getQuestionFromLinkIdAndLocale(questionLinkId, labels) ??
              '';
      return // Question title
          Text('${qTotalIndex + 1}: $questionTitle',
              style: textTheme.headline6, textAlign: TextAlign.start);
    }
  }
}
