import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/_internal/utils/utils.dart';
import 'package:prapare/controllers/commands/abstract_command.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

class ToggleRadioButtonCommand extends AbstractCommand {
  Future<void> execute({
    @required Rx<UserResponse> userResponse,
    @required Answer answer,
    @required String newResponse,
  }) async {
    final answerResponseList = userResponse.value.answers;
    // if toggled to off state
    if (newResponse == null) {
      /// clear all UserResponses
      /// note that if we want to still keep previously written items
      /// we'll need to extract this into a separate method to handle different answer types
      answerResponseList.clear();
    } else {
      // decide if this will have an optional 'other' write-in option
      // First, handle ItemType.choice
      final AnswerResponse newAnswer = AnswerResponseUtil()
          .newAnswerResponseFromAnswerAndValue(
              answer: answer, newValue: newResponse);

      if (answerResponseList.isEmpty) {
        // create new response if one doesn't exist
        answerResponseList.add(newAnswer);
      } else {
        if (answerResponseList is AnswerCode ||
            answerResponseList is AnswerOther) {
          // otherwise, replace first available value with this new code
          // todo
          final AnswerResponse oldAnswer = answerResponseList.firstWhere(
              (element) => element is AnswerCode || element is AnswerOther);
          answerResponseList.remove(oldAnswer);
          answerResponseList.add(newAnswer);
        }
      }
    }
    // responsesController.update();

    // check validator to see if survey is complete
    validationController
        .validateIfGroupIsCompleted(userResponse.value.questionLinkId);
  }
}
