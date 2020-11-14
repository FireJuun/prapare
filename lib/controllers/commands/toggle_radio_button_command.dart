import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/commands/abstract_command.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';
import 'package:prapare/models/fhir_questionnaire/survey/response_type.dart';

class ToggleRadioButtonCommand extends AbstractCommand {
  Future<void> execute({
    @required Rx<UserResponse> oldResponse,
    @required UserResponse newResponse,
  }) async {
    // if toggled to off state
    if (newResponse == null) {
      // set this boolean to false
      oldResponse.value.responseType.value = false;

      final UserResponse _blankAnswerResponse = UserResponse(
        surveyCode: oldResponse.value.surveyCode,
        questionCode: oldResponse.value.questionCode,
        answerCode: '',
        responseType: ResponseBoolean(false),
      );

      // reset the mapped userResponse (so that the button toggles off)
      responsesController
          .rxMappedActiveResponses[oldResponse.value.questionCode]
          .value = _blankAnswerResponse;
    } else {
      // find all responses in the set and turn off their booleans
      responsesController
          .setAllQuestionBooleansToFalse(oldResponse.value.questionCode);

      // then toggle this boolean
      newResponse.responseType.value = true;

      // set active response field
      responsesController
          .rxMappedActiveResponses[oldResponse.value.questionCode]
          .value = newResponse;
    }
    responsesController.update();
  }
}
