import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

abstract class AnswerItem {
  AnswerItem({@required this.answer, @required this.rxUserResponse})
      : assert(answer != null),
        assert(rxUserResponse != null);
  final Answer answer;
  final Rx<UserResponse> rxUserResponse;

  Widget buildAnswer(BuildContext context) => throw UnimplementedError();
}
