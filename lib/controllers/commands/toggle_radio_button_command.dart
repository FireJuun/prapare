import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/commands/abstract_command.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

class ToggleRadioButtonCommand extends AbstractCommand {
  Future<void> execute({
    @required Rx<UserResponse> userResponse,
    @required String newResponse,
  }) async {
    // if toggled to off state
    if (newResponse == null) {
      /// clear all UserResponses
      /// note that if we want to still keep previously written items
      /// we'll need to extract this into a separate method to handle different answer types
      userResponse.value.answers.clear();
    } else {
      if (userResponse.value.answers.isEmpty) {
        // create new response if one doesn't exist
        userResponse.value.answers.add(AnswerCode(newResponse));
      } else {
        // otherwise, replace first value with this new code
        userResponse.value.answers[0] = AnswerCode(newResponse);
      }
    }
    // responsesController.update();

    // check validator to see if survey is complete
    // ToDo: not sure how to change this method
    // validationController
    // .validateIfGroupIsCompleted(userResponse.value.questionLinkId);
  }
}
