import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/commands/abstract_command.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

class ToggleCheckboxCommand extends AbstractCommand {
  Future<void> execute(
      {@required Rx<UserResponse> userResponse,
      @required Answer answer,
      @required bool newValue}) async {
    if (userResponse.value.answers.isEmpty) {
      // if the list is empty, add this response
      // todo: this will need to add answer Other, if free text is available
      userResponse.value.answers.add(AnswerCode(answer.code));
    } else {
      /// Remove the old value, if it is present in the list
      /// This will toggle false booleans off, and prevent duplicate true entry (if possible)
      userResponse.value.answers
          .removeWhere((element) => element.value == answer.code);

      // If true entry, add this response
      if (newValue) {
        userResponse.value.answers.add(AnswerCode(answer.code));
      }
    }

    // check validator to see if survey is complete
    validationController
        .validateIfGroupIsCompleted(userResponse.value.questionLinkId);
  }
}
