import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/commands/abstract_command.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

class ToggleCheckboxCommand extends AbstractCommand {
  @override
  Future<void> execute(
      {@required Rx<UserResponse> userResponse,
      @required Answer answer,
      @required bool newValue}) async {
    final List<AnswerResponse> answerResponseList = userResponse.value.answers;

    if (answerResponseList.isEmpty) {
      // if the list is empty, add this response
      // todo: this will need to add answer Other, if free text is available
      answerResponseList.add(AnswerCode(answer.code));
    } else {
      /// Remove the old value, if it is present in the list
      /// This will toggle false booleans off, and prevent duplicate true entry (if possible)
      answerResponseList.removeWhere((element) => element.value == answer.code);

      // If true entry, add this response
      if (newValue) {
        answerResponseList.add(AnswerCode(answer.code));
      }
    }

    // check validator to see if survey is complete
    validationController.validateIfQuestionIsCompleted(userResponse);
    validationController
        .validateIfGroupIsCompleted(userResponse.value.questionLinkId);

    responsesController.update();
  }
}
