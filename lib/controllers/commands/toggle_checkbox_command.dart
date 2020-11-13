import 'package:flutter/material.dart';
import 'package:prapare/controllers/commands/abstract_command.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

class ToggleCheckboxCommand extends AbstractCommand {
  Future<void> execute(
      {@required UserResponse userResponse, bool newValue}) async {
    userResponse.responseType.value =
        newValue ?? !userResponse.responseType.value;

    // is this necessary?
    questionnaireController.update();
  }
}
