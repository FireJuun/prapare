import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/_internal/utils/utils.dart';
import 'package:prapare/controllers/commands/commands.dart';
import 'package:prapare/controllers/controllers.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';
import 'package:prapare/models/fhir_questionnaire/survey/user_response/user_response.dart';
import 'package:prapare/models/fhir_questionnaire/survey/answer.dart';
import 'package:prapare/ui/views/survey/answer/answer_item.dart';

import 'answer_title.dart';

class AnswerItemDeclineToAnswer extends StatelessWidget implements AnswerItem {
  const AnswerItemDeclineToAnswer(
      {Key key,
      @required this.question,
      @required this.answer,
      @required this.userResponse})
      : assert(question != null),
        assert(answer != null),
        assert(userResponse != null),
        super(key: key);

  @override
  final Question question;
  @override
  final Answer answer;
  @override
  final Rx<UserResponse> userResponse;
  @override
  Widget buildAnswer(BuildContext context) {
    final ValidationController controller = Get.find();

    // this is used in case the user response is a nested value
    final String groupAndQuestionId =
        LinkIdUtil().getGroupAndQuestionId(userResponse.value.questionLinkId);
    final QuestionValidators qValidators =
        controller.questionValidatorsMap[groupAndQuestionId];

    final RxBool activeBool = qValidators?.isQuestionDeclined;

    return Obx(() => SwitchListTile(
          title: AnswerTitle(answer: answer),
          value: activeBool.value,
          onChanged: (bool newValue) => ToggleDeclineToRespondCommand().execute(
              qValidators: qValidators,
              userResponse: userResponse,
              newValue: newValue),
        ));
  }

  @override
  Widget build(BuildContext context) => buildAnswer(context);
}
