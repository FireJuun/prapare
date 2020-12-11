import 'package:prapare/_internal/utils/utils.dart';
import 'package:prapare/models/fhir_questionnaire/survey/enums/item_type.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';
import 'package:validators/validators.dart' as validate;

class ValidatorsUtil {
  bool isValidDecimal(String str) => validate.isFloat(str);
  bool isValidInteger(String str) => validate.isInt(str);

  bool isEmpty(String str) => str == null || str == '';
  bool isNotEmpty(String str) => str != null && str != '';

  bool isAnswerValidByItemType(String value, ItemType itemType) {
    // used for TextFormField validation
    switch (itemType) {
      case ItemType.open_choice:
      // todo: verify open choice is handled same way as strings
      case ItemType.string:
      case ItemType.text:
        return isNotEmpty(value);
      case ItemType.decimal:
        return isValidDecimal(value);
      case ItemType.integer:
        return isValidInteger(value);
      default:
        return false;
    }
  }

  String validateNewAnswerValue(String newValue, Answer answer) {
    if (isNotEmpty(newValue)) {
      if (isAnswerValidByItemType(newValue, answer.answerItemType)) {
        // Items are valid, no
        return null;
      }
      // todo: create locale labels for this error message
      return 'Error: Invalid data type for ' +
          answer.answerItemType.toString().split('.').last;
    }
    return null;
  }
}
