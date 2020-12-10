import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/_internal/utils/utils.dart';
import 'package:prapare/controllers/commands/abstract_command.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';
import 'package:prapare/models/fhir_questionnaire/survey/enums/item_type.dart';

class DebounceAndSaveResponseCommand extends AbstractCommand {
  @override
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

      if (ValidatorsUtil().isEmpty(debouncedValue)) {
        switch (answer.answerItemType) {
          case ItemType.open_choice:
          case ItemType.text:
          case ItemType.string:
            _setUserResponseValue('');
            break;

          // first, set bool / decimal / integer values to null
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

      // check to see if all TextFormFields are valid
      validationController.formKey.currentState.validate();

      // check to see if question has answers
      validationController.validateIfQuestionIsCompleted(userResponse);

      // check validator to see if survey is complete
      validationController
          .validateIfGroupIsCompleted(userResponse.value.questionLinkId);
    },
        // time to debounce (wait) before saving
        time: const Duration(seconds: 1));
  }
}
