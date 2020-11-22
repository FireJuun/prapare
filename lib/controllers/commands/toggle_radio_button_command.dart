import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/commands/abstract_command.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

class ToggleRadioButtonCommand extends AbstractCommand {
  Future<void> execute({
    @required Rx<UserResponse> oldResponse,
    @required UserResponse newResponse,
  }) async {
    // if toggled to off state
    if (newResponse == null) {
      // set this boolean to false
      oldResponse.value.answers[0].value = false;

      final UserResponse _blankAnswerResponse = UserResponse(
        questionLinkId: oldResponse.value.questionLinkId,
        answers: [AnswerBoolean(false)],
      );

      // reset the mapped userResponse (so that the button toggles off)
      responsesController
          .rxMappedActiveResponses[oldResponse.value.questionLinkId]
          .value = _blankAnswerResponse;
    } else {
      // find all responses in the set and turn off their booleans
      responsesController
          .setAllQuestionBooleansToFalse(oldResponse.value.questionLinkId);

      // then toggle this boolean
      newResponse.answers[0].value = true;

      // set active response field
      responsesController
          .rxMappedActiveResponses[oldResponse.value.questionLinkId]
          .value = newResponse;
    }

    // check validator to see if survey is complete
    // ToDo: not sure how to change this method
    validationController
        .validateIfSurveyIsCompleted(oldResponse.value.questionLinkId);
  }
}
