import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/commands/abstract_command.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

class ToggleDeclineToRespondCommand extends AbstractCommand {
  @override
  Future<void> execute({
    @required QuestionValidators qValidators,
    @required Rx<UserResponse> userResponse,
    @required bool newValue,
  }) async {
    qValidators.isDeclineToAnswerSelected.value = newValue;

    // if on, set isExpanded to false, which closes the item
    if (newValue && qValidators.isExpanded.value) {
      qValidators.isExpanded.value = false;
    }

    // when toggled on...
    if (newValue) {
      // remove other/prior responses for this question
      responsesController.clearAllUserResponses(userResponse);
    }
  }
}
