import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

class AnswerItemDecimal extends StatelessWidget {
  const AnswerItemDecimal(
      {Key key, @required this.answer, @required this.rxUserResponse})
      : super(key: key);

  final Answer answer;
  final Rx<UserResponse> rxUserResponse;

  @override
  Widget build(BuildContext context) {
    // todo: handle item entry + debounce
    return TextField(
        // onSubmitted: () {},
        decoration: InputDecoration(
      border: OutlineInputBorder(),
      labelText: 'Password',
    ));
  }
}
