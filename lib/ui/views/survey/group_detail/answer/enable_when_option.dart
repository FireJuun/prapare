import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/_internal/utils/utils.dart';
import 'package:prapare/controllers/controllers.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

class EnableWhenOption extends StatelessWidget {
  const EnableWhenOption({
    Key key,
    @required this.question,
    @required this.answer,
    @required this.userResponse,
    @required this.answerItemWidget,
  })  : assert(question != null),
        assert(answer != null),
        assert(userResponse != null),
        assert(answerItemWidget != null),
        super(key: key);

  final Question question;
  final Answer answer;
  final Rx<UserResponse> userResponse;
  final Widget answerItemWidget;

  @override
  Widget build(BuildContext context) {
    final ValidationController validationController = Get.find();

    if (!validationController.isAnswerAnEnableWhenOption(question, answer) ||
        question.subQuestions == null) {
      return answerItemWidget;
    } else
      return Obx(() {
        final UserResponsesController userResponsesController = Get.find();

        /// for now, the enableWhen option only works with nested subquestions
        /// todo: improved error handling for missing questions
        final Question enabledQuestion =
            question.subQuestions.firstWhere((e) => e.linkId == answer.code);
        final Answer enabledAnswer =
            enabledQuestion.answers.firstWhere((e) => e.code == answer.code);
        final Rx<UserResponse> enabledUserResponse =
            userResponsesController.findActiveResponse(enabledQuestion.linkId);

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            answerItemWidget,
            (validationController.getEnableWhenBool(question, answer).value)
                ? AnswerItemUtil().buildAnswerWidgetByItemType(
                    enabledQuestion, enabledAnswer, enabledUserResponse)
                : Container(),
          ],
        );
      });
  }
}
