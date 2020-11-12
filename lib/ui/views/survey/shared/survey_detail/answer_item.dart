import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/_internal/utils/prapare_codes_util.dart';
import 'package:prapare/localization.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';
import 'package:prapare/ui/views/survey/shared/survey_detail/survey_detail_controller.dart';

class AnswerItem extends StatelessWidget {
  const AnswerItem(
      {Key key,
      @required this.survey,
      @required this.question,
      @required this.qIndex,
      @required this.answer,
      @required this.answerIndex})
      : super(key: key);

  final Survey survey;
  final Question question;
  final int qIndex;
  final Answer answer;
  final int answerIndex;

  @override
  Widget build(BuildContext context) {
    final SurveyDetailController controller = Get.find();
    final PrapareCodesUtil codesUtil = PrapareCodesUtil();

    try {
      switch (codesUtil.getAnswerTypeFromQuestionCode(question.code)) {

        // **** Checkbox Answer ***
        case answerType.checkbox:
          final Rx<UserResponse> response = controller.findUserResponseBySurvey(
              survey: survey, qIndex: qIndex);

          return CheckboxListTile(
              title: _AnswerTitle(answer: answer),
              value: response.value.responseType.value,
              onChanged: (value) => controller.toggleChecked(response));

        // **** DEFAULT: Radio Button Answer ***
        default:
          return RadioListTile<String>(
            title: _AnswerTitle(answer: answer),
            value: answer.code,
            groupValue: controller
                .findUserResponseBySurvey(survey: survey, qIndex: qIndex)
                .value
                .answerCode,
            toggleable: true,
            onChanged: (String value) => controller.setUserAnswerBySurvey(
                survey: survey, qIndex: qIndex, ansIndex: answerIndex),
          );
      }
    } catch (error) {
      return Container(child: Text(error.message));
    }
  }
}

class _AnswerTitle extends StatelessWidget {
  const _AnswerTitle({
    Key key,
    @required this.answer,
  })  : assert(answer != null),
        super(key: key);

  final Answer answer;

  @override
  Widget build(BuildContext context) {
    final PrapareCodesUtil codesUtil = PrapareCodesUtil();
    final AppLocalizations_Labels labels = AppLocalizations.of(context);

    return Text(codesUtil.getAnswerFromLinkIdAndLocale(answer.code, labels));
  }
}
