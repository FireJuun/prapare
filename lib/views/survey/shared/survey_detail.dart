import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/models/data/survey/question.dart';
import 'package:prapare/views/survey/shared/survey_detail_controller.dart';

class SurveyDetail extends StatelessWidget {
  final String surveyCode;

  const SurveyDetail({Key key, @required this.surveyCode})
      : assert(surveyCode != null),
        super(key: key);

  Widget build(BuildContext context) {
    // for now, using GetBuilder instead of GetX so that update() calls in the controller will trigger a redraw of the UI
    return GetBuilder<SurveyDetailController>(
      builder: (controller) {
        final textTheme = context.textTheme;
        var survey = controller.data.getSurveyFromCode(surveyCode);

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
              Text('${qTotalIndex + 1}: ${question.text}',
                  style: textTheme.headline6, textAlign: TextAlign.start),

              // All answers are mapped out using spread operator
              // todo: add handling of checkboxes and 'other' data entry
              ...question.answers.toList().asMap().entries.map(
                (answer) {
                  return RadioListTile<String>(
                    title: Text(question.answers.elementAt(answer.key).text),
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
              SizedBox(height: 16),
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
