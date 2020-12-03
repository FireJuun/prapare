import 'package:flutter/material.dart';
import 'package:prapare/controllers/commands/abstract_command.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

class ToggleDeclineToRespondCommand extends AbstractCommand {
  Future<void> execute(
      {@required QuestionValidators qValidators,
      @required bool newValue}) async {
    qValidators.isDeclineToAnswerSelected.value = newValue;

    // close
    if (newValue && qValidators.isExpanded.value) {
      qValidators.isExpanded.value = false;
    }
    // todo: clear answered values from Rx<UserResponse>
    // clearing these values will change based on user response type
    // bool vs choice, open_choice, check_box are handled differently
  }
}
