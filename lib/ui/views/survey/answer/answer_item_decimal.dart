import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

class AnswerItemDecimal extends StatelessWidget {
  const AnswerItemDecimal({
    Key key,
    @required this.answer,
    @required this.rxUserResponse,
    bool isInteger,
  })  : _isInteger = isInteger ?? false,
        super(key: key);

  final Answer answer;
  final Rx<UserResponse> rxUserResponse;
  final bool _isInteger;

  @override
  Widget build(BuildContext context) {
    // todo: handle item entry + debounce
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: TextField(
        keyboardType: TextInputType.numberWithOptions(decimal: !_isInteger),
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: 'answer: ${_isInteger ? "integer" : "decimal"}',
        ),
      ),
    );
  }
}
