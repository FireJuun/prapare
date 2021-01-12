import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

import 'enable_when_option.dart';

abstract class AnswerItem {
  AnswerItem(
      {@required this.question,
      @required this.answer,
      @required this.userResponse})
      : assert(question != null),
        assert(answer != null),
        assert(userResponse != null);
  final Question question;
  final Answer answer;
  final Rx<UserResponse> userResponse;

  Widget buildAnswer(BuildContext context) => throw UnimplementedError();

  Widget buildAnswerAndEnableWhenOption(BuildContext context) =>
      // placeholder text, to copy into concrete implementations of this abstract class
      EnableWhenOption(
        question: question,
        answer: answer,
        userResponse: userResponse,
        answerItemWidget: buildAnswer(context),
      );
}
