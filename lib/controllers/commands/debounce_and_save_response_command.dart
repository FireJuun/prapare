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
      newResponse.responseType.value = debouncedValue;

      // set rxUserResponse and ActiveResponse values
      response.value = newResponse;
      responsesController
          .findActiveResponse(response.value.questionCode)
          .value = newResponse;

      // check validator to see if survey is complete
      surveyController.validateIfSurveyIsCompleted(newResponse.surveyCode);
    },
        // time to debounce (wait) before saving
        time: const Duration(seconds: 1));
  }
}
