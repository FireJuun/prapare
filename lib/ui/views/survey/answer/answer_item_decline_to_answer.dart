import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/_internal/utils/utils.dart';
import 'package:prapare/controllers/controllers.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';
import 'package:prapare/models/fhir_questionnaire/survey/user_response/user_response.dart';
import 'package:prapare/models/fhir_questionnaire/survey/answer.dart';
import 'package:get/get_rx/src/rx_core/rx_impl.dart';
import 'package:prapare/ui/views/survey/answer/answer_item.dart';

import 'answer_title.dart';

class AnswerItemDeclineToAnswer extends StatelessWidget implements AnswerItem {
  const AnswerItemDeclineToAnswer({
    Key key,
    @required this.answer,
    @required this.rxUserResponse,
  })  : assert(answer != null),
        assert(rxUserResponse != null),
        super(key: key);

  @override
  final Answer answer;
  @override
  final Rx<UserResponse> rxUserResponse;

  @override
  Widget buildAnswer(BuildContext context) {
    final ValidationController controller = Get.find();

    // this is used in case the user response is a nested value
    final String groupAndQuestionId =
        LinkIdUtil().getGroupAndQuestionId(rxUserResponse.value.questionLinkId);
    final QuestionValidators validators =
        controller.rxQuestionValidatorsMap[groupAndQuestionId];

    final RxBool activeBool = validators?.isDeclineToAnswerSelected;

    return Obx(() => SwitchListTile(
          title: AnswerTitle(answer: answer),
          value: activeBool.value,
          onChanged: (bool value) {
            activeBool.value = value;
            // todo: set up decline to answer command
            // this will need to change based on user response type
            // bool vs choice, open_choice, check_box are handled differently
          },
        ));
  }

  @override
  Widget build(BuildContext context) => buildAnswer(context);
}
