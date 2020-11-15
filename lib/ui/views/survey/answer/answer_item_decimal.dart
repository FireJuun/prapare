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
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: TextField(
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'answer: decimal',
          )),
    );
  }
}
