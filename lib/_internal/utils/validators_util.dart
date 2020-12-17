import 'package:prapare/models/fhir_questionnaire/survey/enums/item_type.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';
import 'package:validators/validators.dart' as validate;

class ValidatorsUtil {
  bool isValidDecimal(String str) => validate.isFloat(str) && str != '';
  bool isValidInteger(String str) => validate.isInt(str) && str != '';

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

  bool isNewAnswerValueValid(String newValue, Answer answer) {
    bool validator = true;

    /// empty choices count as valid, as do those w/ data that match their ItemType
    if (isNotEmpty(newValue) &&
        !isAnswerValidByItemType(newValue, answer.answerItemType)) {
      validator = false;
    }
    return validator;
  }
}
