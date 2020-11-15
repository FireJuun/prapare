import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

class AnswerItemString extends StatelessWidget {
  const AnswerItemString(
      {Key key,
      @required this.answer,
      @required this.rxUserResponse,
      bool isMultiLine})
      : _isMultiLine = isMultiLine ?? false,
        super(key: key);

  final Answer answer;
  final Rx<UserResponse> rxUserResponse;
  final bool _isMultiLine;

  @override
  Widget build(BuildContext context) {
    // todo: handle item entry + debounce
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: TextField(
          minLines: _isMultiLine ? 3 : 1,
          maxLines: _isMultiLine ? 6 : 1,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'answer: string',
          )),
    );
  }
}
