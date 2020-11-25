import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/commands/commands.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';
import 'package:prapare/models/fhir_questionnaire/survey/enums/item_type.dart';

class AnswerItemDecimal extends StatefulWidget {
  const AnswerItemDecimal({
    Key key,
    @required this.answer,
    @required this.rxUserResponse,
  })  : assert(answer != null),
        assert(rxUserResponse != null),
        super(key: key);

  final Answer answer;
  final Rx<UserResponse> rxUserResponse;

  @override
  _AnswerItemDecimalState createState() => _AnswerItemDecimalState();
}

class _AnswerItemDecimalState extends State<AnswerItemDecimal> {
  TextEditingController _textEditingController;
  final RxString _rxString = ''.obs;

  @override
  Widget build(BuildContext context) {
    final bool _isInteger = widget.answer.answerItemType == ItemType.integer;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: TextField(
        controller: _textEditingController,
        onChanged: (newValue) => _rxString.value = newValue.toString(),
        keyboardType: TextInputType.numberWithOptions(decimal: !_isInteger),
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: 'answer: ${_isInteger ? "integer" : "decimal"}',
        ),
      ),
    );
  }

  @override
  void initState() {
    // initial value set to blank if you type in 0 or 0.0

    _textEditingController = TextEditingController(
        // ToDo: works only for answer
        text: widget.rxUserResponse.value.answers[0].value?.toString() ?? '');
    DebounceAndSaveResponseCommand().execute(
        rxString: _rxString,
        answer: widget.answer,
        userResponse: widget.rxUserResponse);
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
