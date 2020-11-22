part of 'user_response.dart';

abstract class AnswerResponse {
  AnswerResponse(this.value);
  dynamic value;
  ItemType responseItemType;
}

/// answers that were supplied with the question (only used for Question types
/// of choice and open-choice)
class AnswerCode extends AnswerResponse {
  AnswerCode(String value) : super(value);
  // todo: verify this is correct
  final responseItemValue = ItemType.choice;
}

class AnswerOther extends AnswerResponse {
  AnswerOther(this.code, String value) : super(value);
  String code;
  // todo: verify this is correct
  final responseItemValue = ItemType.open_choice;
}

/// In some cases, boolean answers are accepted
class AnswerBoolean extends AnswerResponse {
  AnswerBoolean(bool value) : super(value);
  final responseItemValue = ItemType.boolean;
}

/// In other cases, decimals are accepted
/// While FHIR accepts this resource as a decimal...
/// Our current data elements only needs integers
class AnswerDecimal extends AnswerResponse {
  AnswerDecimal(double value) : super(value);
  final responseItemValue = ItemType.decimal;
}

class AnswerInteger extends AnswerResponse {
  AnswerInteger(int value) : super(value);
  final responseItemValue = ItemType.integer;
}

/// for any generic case that needs a string (should be short)
class AnswerString extends AnswerResponse {
  AnswerString(String value) : super(value);
  final responseItemValue = ItemType.string;
}

/// for any generic case that needs a string, but can be long
class AnswerText extends AnswerResponse {
  AnswerText(String value) : super(value);
  final responseItemValue = ItemType.text;
}

/// Dates, DateTimes and Times respectively, they will be parsed and any part
/// of the value that is not indicated will be ignored
class AnswerDate extends AnswerResponse {
  AnswerDate(DateTime value) : super(value);
  final responseItemValue = ItemType.date;
}

class AnswerDateTime extends AnswerResponse {
  AnswerDateTime(DateTime value) : super(value);
  final responseItemValue = ItemType.dateTime;
}

class AnswerTime extends AnswerResponse {
  AnswerTime(DateTime value) : super(value);
  final responseItemValue = ItemType.time;
}

/// for a Answer with a URL return value
class AnswerUrl extends AnswerResponse {
  AnswerUrl(Uri value) : super(value);
  final responseItemValue = ItemType.url;
}

/// ToDo: the following three all have FHIR value return types which is not
/// something I want the front end to have to deal with, so I'll probably need
/// to come back and change these to strings
class AnswerAttachment extends AnswerResponse {
  AnswerAttachment(Attachment value) : super(value);
  final responseItemValue = ItemType.attachment;
}

class AnswerReference extends AnswerResponse {
  AnswerReference(Reference value) : super(value);
  final responseItemValue = ItemType.reference;
}

class AnswerQuantity extends AnswerResponse {
  AnswerQuantity(Quantity value) : super(value);
  final responseItemValue = ItemType.quantity;
}
