import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/commands/abstract_command.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';
import 'package:prapare/models/fhir_questionnaire/survey/item_type.dart';

class ToggleRadioButtonCommand extends AbstractCommand {
  Future<void> execute({
    @required Rx<UserResponse> userResponse,
    @required Answer answer,
    @required String newResponse,
  }) async {
    // if toggled to off state
    if (newResponse == null) {
      /// clear all UserResponses
      /// note that if we want to still keep previously written items
      /// we'll need to extract this into a separate method to handle different answer types
      userResponse.value.answers.clear();
    } else {
      // decide if this will have an optional 'other' write-in option
      // First, handle ItemType.choice
      final newAnswer = (answer.answerItemType == ItemType.choice)
          ? AnswerCode(newResponse)
          // then, handle ItemType.openchoice
          : (answer.answerItemType == ItemType.open_choice)
              ? AnswerOther(newResponse, '')
              // if neither option available, place an empty string
              // should this also have error handlng?
              : AnswerString('');

      if (userResponse.value.answers.isEmpty) {
        // create new response if one doesn't exist
        userResponse.value.answers.add(newAnswer);
      } else {
        // otherwise, replace first available value with this new code
        userResponse.value.answers
            .firstWhere(
                (element) => element is AnswerCode || element is AnswerOther)
            .value = newAnswer;
      }
    }
    // responsesController.update();

    // check validator to see if survey is complete
    // ToDo: not sure how to change this method
    validationController
        .validateIfGroupIsCompleted(userResponse.value.questionLinkId);
  }
}
