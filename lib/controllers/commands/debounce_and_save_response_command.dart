import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/_internal/utils/utils.dart';
import 'package:prapare/controllers/commands/abstract_command.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

class DebounceAndSaveResponseCommand extends AbstractCommand {
  @override
  Future<void> execute(
      {@required RxString rxString,
      @required Answer answer,
      @required Rx<UserResponse> userResponse}) async {
    debounce(rxString, (String debouncedValue) {
      final _question = questionnaireController
          .getQuestionFromLinkId(userResponse.value.questionLinkId);

      void _clearResponse() => AnswerResponseUtil().clearUserResponse(
          answer: answer,
          userResponse: userResponse,
          qFormat: _question.format,
          resetDecimalOrStringController: false);

      void _saveResponse() => AnswerResponseUtil().setAnswerResponseValue(
          AnswerResponseUtil()
              .getAnswerResponseFromItemType(userResponse, answer),
          debouncedValue);

      if (ValidatorsUtil().isEmpty(debouncedValue)) {
        _clearResponse();
      } else {
        // if valid answer, store it, otherwise clear what's stored
        (ValidatorsUtil()
                .isAnswerValidByItemType(debouncedValue, answer.answerItemType))
            ? _saveResponse()
            : _clearResponse();
      }

      // check to see if all TextFormFields are valid
      validationController.formKey.currentState.validate();

      // check to see if question has answers
      validationController.validateIfQuestionIsCompleted(userResponse);

      // check validator to see if survey is complete
      validationController
          .validateIfGroupIsCompleted(userResponse.value.questionLinkId);
    },
        // time to debounce (wait) before saving
        time: const Duration(seconds: 1));
  }
}
