import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/commands/abstract_command.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

class DebounceAndSaveResponseCommand extends AbstractCommand {
  Future<void> execute(
      {@required RxString rxString,
      @required Rx<UserResponse> response}) async {
    debounce(rxString, (String debouncedValue) {
      final UserResponse newResponse = response.value;

      // todo: place in new location, when Answers() architecture changes
      newResponse.answers[0].value = debouncedValue;

      // set rxUserResponse and ActiveResponse values
      response.value = newResponse;
      responsesController
          .findActiveResponse(newResponse.answers[0].value.questionCode)
          .value = newResponse;

      // check validator to see if survey is complete
      validationController
          .validateIfSurveyIsCompleted(newResponse.answers[0].value.surveyCode);
    },
        // time to debounce (wait) before saving
        time: const Duration(seconds: 1));
  }
}
