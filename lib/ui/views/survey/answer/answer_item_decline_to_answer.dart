import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    @required this.activeBool,
  })  : assert(answer != null),
        assert(rxUserResponse != null),
        assert(activeBool != null),
        super(key: key);

  @override
  final Answer answer;
  @override
  final Rx<UserResponse> rxUserResponse;
  final RxBool activeBool;

  @override
  Widget buildAnswer(BuildContext context) {
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
