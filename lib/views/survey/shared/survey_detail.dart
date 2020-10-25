import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/models/data/survey/question.dart';
import 'package:prapare/views/survey/shared/survey_detail_controller.dart';

//todos: 1) make the selections persistent (currently changes revert back to defaults when you switch between tabs - whyyyy??) and 2) make it write to a spreadsheet (for now), and ultimately write to a FHIR database

class SurveyDetail extends StatelessWidget {
  final String surveyCode;

  const SurveyDetail({Key key, @required this.surveyCode})
      : assert(surveyCode != null),
        super(key: key);

  Widget build(BuildContext context) {
    // for now, using GetBuilder instead of GetX so that update() calls in the controller will trigger a redraw of the UI
    return GetBuilder<SurveyDetailController>(
      init: Get.put(SurveyDetailController()),
      builder: (controller) {
        final textTheme = context.textTheme;
        var survey = controller.data.getSurveyFromCode(surveyCode);

        Widget mapQuestion(Question question) {
          // find first value that has this question
          final int qIndex = controller.findIndexByQuestion(survey, question);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Question title
              Text('${qIndex + 1}: ${question.text}',
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
