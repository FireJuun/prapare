import 'package:flutter/material.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';
import 'package:prapare/models/fhir_questionnaire/survey/item_type.dart';
import 'package:validators/validators.dart' as validate;
import 'package:validators/sanitizers.dart' as sanitize;

class AnswerResponseUtil {
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
            return AnswerBoolean(true);
          } else if (newValue == 'false') {
            return AnswerBoolean(false);
          }
          return AnswerBoolean(null);
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
