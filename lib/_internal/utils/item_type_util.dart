import 'package:fhir/r4.dart';
import 'package:prapare/models/fhir_questionnaire/survey/enums/item_type.dart';

class ItemTypeUtil {
  /// convert r4 QuestionnaireItemType to ItemType
  /// ItemType is used extensively by AnswerResponses
  ItemType getItemTypeFromQuestionnaireItemType(QuestionnaireItemType q) {
    switch (q) {
      case QuestionnaireItemType.group:
        return ItemType.group;
      case QuestionnaireItemType.display:
        return ItemType.display;
      case QuestionnaireItemType.boolean:
        return ItemType.boolean;
      case QuestionnaireItemType.decimal:
        return ItemType.decimal;
      case QuestionnaireItemType.integer:
        return ItemType.integer;
      case QuestionnaireItemType.date:
        return ItemType.date;
      case QuestionnaireItemType.datetime:
        // todo: capitalization of r4 differs from ItemType
        return ItemType.dateTime;
      case QuestionnaireItemType.time:
        return ItemType.time;
      case QuestionnaireItemType.string:
        return ItemType.string;
      case QuestionnaireItemType.text:
        return ItemType.text;
      case QuestionnaireItemType.url:
        return ItemType.url;
      case QuestionnaireItemType.choice:
        return ItemType.choice;
      case QuestionnaireItemType.open_choice:
        return ItemType.open_choice;
      case QuestionnaireItemType.attachment:
        return ItemType.attachment;
      case QuestionnaireItemType.reference:
        return ItemType.reference;
      case QuestionnaireItemType.quantity:
        return ItemType.quantity;
      case QuestionnaireItemType.unknown:
        // todo: is this correct?
        return ItemType.invalid;
      default:
        return ItemType.invalid;
    }
  }
}
