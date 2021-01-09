import 'package:prapare/_internal/enums/item_type_enum.dart';

/// itemType as defined: https://www.hl7.org/fhir/valueset-item-type.html
const stringToItemTypeMap = {
  'group': ItemType.group,
  'display': ItemType.display,
  'question': ItemType.question,
  'boolean': ItemType.boolean,
  'decimal': ItemType.decimal,
  'integer': ItemType.integer,
  'date': ItemType.date,
  'dateTime': ItemType.dateTime,
  'time': ItemType.time,
  'string': ItemType.string,
  'text': ItemType.text,
  'url': ItemType.url,
  'choice': ItemType.choice,
  'open_choice': ItemType.open_choice,
  'attachment': ItemType.attachment,
  'reference': ItemType.reference,
  'quantity': ItemType.quantity,
};
