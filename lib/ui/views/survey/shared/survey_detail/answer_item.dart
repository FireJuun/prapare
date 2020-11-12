import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/_internal/utils/prapare_codes_util.dart';
import 'package:prapare/localization.dart';
import 'package:prapare/models/data/survey/answer.dart';
import 'package:prapare/models/data/survey/question.dart';
import 'package:prapare/models/data/survey/survey.dart';
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
    final AppLocalizations_Labels labels = AppLocalizations.of(context);

    return RadioListTile<String>(
      title: Text(codesUtil.getAnswerFromLinkIdAndLocale(
          question.answers.elementAt(answerIndex).code, labels)),
      value: question.answers.elementAt(answerIndex).code,
      groupValue: controller
          .findUserResponseBySurvey(survey: survey, qIndex: qIndex)
          .value
          .answerCode,
      toggleable: true,
      onChanged: (String value) => controller.setUserAnswerBySurvey(
          survey: survey, qIndex: qIndex, ansIndex: answerIndex),
    );
  }
}
