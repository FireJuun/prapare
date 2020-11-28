import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/commands/commands.dart';
import 'package:prapare/models/fhir_questionnaire/survey/enums/item_type.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

import 'answer_item.dart';

class AnswerItemString extends StatefulWidget {
  const AnswerItemString({
    Key key,
    @required this.answer,
    @required this.rxUserResponse,
  })  : assert(answer != null),
        assert(rxUserResponse != null),
        super(key: key);

  final Answer answer;
  final Rx<UserResponse> rxUserResponse;

  @override
  _AnswerItemStringState createState() => _AnswerItemStringState();
}

class _AnswerItemStringState extends State<AnswerItemString>
    implements AnswerItem {
  TextEditingController _textEditingController;
  final RxString _obj = ''.obs;

  @override
  Answer get answer => widget.answer;
  @override
  Rx<UserResponse> get rxUserResponse => widget.rxUserResponse;

  @override
  Widget buildItem(BuildContext context) {
    // [AnswerText] accepts multi-line, whereas [AnswerString] prefers single
    final bool _isMultiLine = answer.answerItemType == ItemType.text;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: TextField(
        controller: _textEditingController,
        onChanged: (newValue) => _obj.value = newValue,
        minLines: _isMultiLine ? 3 : 1,
        maxLines: _isMultiLine ? 6 : 1,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: 'answer: ' + (_isMultiLine ? 'text' : 'string'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => buildItem(context);

  @override
  void initState() {
    _textEditingController =
        TextEditingController(text: rxUserResponse.value.answers[0].value);
    DebounceAndSaveResponseCommand()
        .execute(rxString: _obj, answer: answer, userResponse: rxUserResponse);
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
