import 'package:flutter/material.dart';
import 'package:prapare/controllers/commands/abstract_command.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';
import 'package:prapare/models/fhir_questionnaire/survey/response_type.dart';

class ToggleRadioButtonCommand extends AbstractCommand {
  Future<void> execute({
    @required UserResponse oldResponse,
    @required UserResponse newResponse,
  }) async {
    // if toggled to off state
    if (newResponse == null) {
      // set this boolean to false
      oldResponse.responseType.value = false;

      // and reset the active UserResponse
      responsesController.rxMappedActiveResponses[oldResponse.questionCode] =
          UserResponse(
        surveyCode: oldResponse.surveyCode,
        questionCode: oldResponse.questionCode,
        answerCode: '',
        responseType: ResponseBoolean(false),
      );
      // _activeResponse[sIndex][qIndex] = UserResponse();
    } else {
      // find all responses in the set and turn off their booleans
      responsesController
          .setAllQuestionBooleansToFalse(oldResponse.questionCode);

      // then toggle this boolean
      newResponse.responseType.value = true;
      // set active response field
      responsesController.rxMappedActiveResponses[oldResponse.questionCode] =
          newResponse;
    }

    responsesController.update();
  }
}
