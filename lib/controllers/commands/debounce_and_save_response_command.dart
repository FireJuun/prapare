import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/commands/abstract_command.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';
import 'package:prapare/models/fhir_questionnaire/survey/item_type.dart';

class DebounceAndSaveResponseCommand extends AbstractCommand {
  Future<void> execute(
      {@required RxString rxString,
      @required Answer answer,
      @required Rx<UserResponse> userResponse}) async {
    debounce(rxString, (String debouncedValue) {
      // find fist instance of a value, then set it as defined below
      void _setUserResponseValue(dynamic newValue) {
        userResponse.value.answers
            .firstWhere(
                (element) => element.responseItemType == answer.answerItemType)
            .value = newValue;
      }

      if (debouncedValue == null || debouncedValue == '') {
        // first, set bool / decimal / integer values to null
        switch (answer.answerItemType) {
          case ItemType.boolean:
          case ItemType.decimal:
          case ItemType.integer:
            _setUserResponseValue(null);
            break;
          default:
            break;
        }
      } else {
        _setUserResponseValue(debouncedValue);
      }

      // check validator to see if survey is complete
      validationController
          .validateIfGroupIsCompleted(userResponse.value.questionLinkId);
    },
        // time to debounce (wait) before saving
        time: const Duration(seconds: 1));
  }
}
