import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/_internal/utils/prapare_codes_util.dart';
import 'package:prapare/localization.dart';
import 'package:prapare/models/data/survey/question.dart';
import 'package:prapare/models/data/survey/survey.dart';
import 'package:prapare/ui/views/survey/shared/survey_detail/survey_detail_controller.dart';

class SurveyDetail extends StatelessWidget {
  const SurveyDetail({Key key, @required this.surveyCode})
      : assert(surveyCode != null),
        super(key: key);

  final String surveyCode;

  @override
  Widget build(BuildContext context) {
    // for now, using GetBuilder instead of GetX so that update() calls in the controller will trigger a redraw of the UI
    return GetBuilder<SurveyDetailController>(
      builder: (controller) {
        final TextTheme textTheme = context.textTheme;
        final Survey survey = controller.data.getSurveyFromCode(surveyCode);
        final PrapareCodesUtil codesUtil = PrapareCodesUtil();
        final AppLocalizations_Labels labels = AppLocalizations.of(context);

        Widget mapQuestion(Question question) {
          // Unused: find index of question w/in survey
          final int qIndex = controller.findIndexByQuestion(survey, question);

          /// Combine all questions, then get index number
          /// Note that this assumems each question / survey is unique
          final int qTotalIndex =
              controller.data.getTotalIndexFromQuestion(question);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Question title
              Text(
                  '${qTotalIndex + 1}: ${codesUtil.getStringFromLinkIdAndLocale(question.code, labels)}',
                  style: textTheme.headline6,
                  textAlign: TextAlign.start),

              // All answers are mapped out using spread operator
              // todo: add handling of checkboxes and 'other' data entry
              ...question.answers.toList().asMap().entries.map(
                (answer) {
                  return RadioListTile<String>(
                    title: Text(codesUtil.getStringFromLinkIdAndLocale(
                        question.answers.elementAt(answer.key).code, labels)),
                    value: question.answers.elementAt(answer.key).code,
                    groupValue: controller
                        .findUserResponseBySurvey(
                            survey: survey, qIndex: qIndex)
                        .value
                        .answerCode,
                    toggleable: true,
                    onChanged: (String value) =>
                        controller.setUserAnswerBySurvey(
                            survey: survey,
                            qIndex: qIndex,
                            ansIndex: answer.key),
                  );
                },
              ),
              // Extra padding at end
              const SizedBox(height: 16),
            ],
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: <Widget>[
              ...survey.questions.map((e) => mapQuestion(e)),
            ],
          ),
        );
      },
    );
  }
}
