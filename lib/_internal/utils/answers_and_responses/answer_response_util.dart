import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';
import 'package:prapare/_internal/enums/item_type_enum.dart';
import 'package:validators/validators.dart' as validate;
import 'package:validators/sanitizers.dart' as sanitize;

class AnswerResponseUtil {
  AnswerResponse getAnswerResponseFromItemType(
          Rx<UserResponse> userResponse, Answer answer) =>
      userResponse.value.answers.firstWhere(
          (element) => element.responseItemType == answer.answerItemType,
          orElse: () => newAnswerResponseFromAnswerAndValue(
              answer: answer, newValue: ''));

  String getAnswerCodeFromAnswerResponse(
      AnswerResponse answerResponse, Rx<UserResponse> userResponse) {
    String answerCode;

    if (answerResponse is AnswerCode) {
      answerCode = answerResponse.value;
    } else if (answerResponse is AnswerOther) {
      answerCode = answerResponse.code;
    } else if (answerResponse is AnswerBoolean) {
      answerCode = answerResponse.code;
    } else {
      answerCode = userResponse.value.questionLinkId;
    }
    return answerCode;
  }

  void setAnswerResponseValue(
          AnswerResponse answerResponse, dynamic newValue) =>
      answerResponse.value = newValue;

  AnswerResponse newAnswerResponseFromAnswerAndValue(
      {@required Answer answer, @required String newValue}) {
    switch (answer.answerItemType) {
      case ItemType.choice:
        {
          if (newValue != answer.code) {
            print('error: $newValue != ${answer.code}');
          }
          // should this just be answer.code or newValue?
          // technically, they should be the same
          return AnswerCode(answer.code);
        }
      case ItemType.open_choice:
        return AnswerOther(answer.code, newValue);
      case ItemType.boolean:
        {
          if (newValue == 'true') {
            return AnswerBoolean(answer.code, true);
          } else if (newValue == 'false') {
            return AnswerBoolean(answer.code, false);
          }
          return AnswerBoolean(answer.code, null);
        }
      case ItemType.decimal:
        {
          if (validate.isFloat(newValue)) {
            return AnswerDecimal(sanitize.toDouble(newValue));
          }
          return AnswerDecimal(null);
        }
        break;
      case ItemType.integer:
        {
          if (validate.isInt(newValue)) {
            return AnswerInteger(sanitize.toInt(newValue));
          }
          return AnswerInteger(null);
        }

      case ItemType.string:
        return AnswerString(newValue);

      case ItemType.text:
        return AnswerText(newValue);

      default:
        return AnswerString('');
    }
  }
}
