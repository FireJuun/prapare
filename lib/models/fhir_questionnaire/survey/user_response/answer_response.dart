part of 'user_response.dart';

abstract class AnswerResponse {
  AnswerResponse(this.value) {
    _setResponseItemType();
  }

  dynamic value;
  ItemType responseItemType;

  // defaults to invalid until responseItemType is explicity set
  void _setResponseItemType() => responseItemType = ItemType.invalid;
}

/// answers that were supplied with the question (only used for Question types
/// of choice and open-choice)
class AnswerCode extends AnswerResponse {
  AnswerCode(String value) : super(value);

  // todo: verify this is correct
  @override
  void _setResponseItemType() => responseItemType = ItemType.choice;
}

class AnswerOther extends AnswerResponse {
  AnswerOther(this.code, String value) : super(value);
  String code;
  // todo: verify this is correct
  @override
  void _setResponseItemType() => responseItemType = ItemType.open_choice;
}

/// In some cases, boolean answers are accepted
class AnswerBoolean extends AnswerResponse {
  AnswerBoolean(bool value) : super(value);
  @override
  void _setResponseItemType() => responseItemType = ItemType.boolean;
}

/// In other cases, decimals are accepted
/// While FHIR accepts this resource as a decimal...
/// Our current data elements only needs integers
class AnswerDecimal extends AnswerResponse {
  AnswerDecimal(double value) : super(value);
  @override
  void _setResponseItemType() => responseItemType = ItemType.decimal;
}

class AnswerInteger extends AnswerResponse {
  AnswerInteger(int value) : super(value);
  @override
  void _setResponseItemType() => responseItemType = ItemType.integer;
}

/// for any generic case that needs a string (should be short)
class AnswerString extends AnswerResponse {
  AnswerString(String value) : super(value);
  @override
  void _setResponseItemType() => responseItemType = ItemType.string;
}

/// for any generic case that needs a string, but can be long
class AnswerText extends AnswerResponse {
  AnswerText(String value) : super(value);
  @override
  void _setResponseItemType() => responseItemType = ItemType.text;
}

/// Dates, DateTimes and Times respectively, they will be parsed and any part
/// of the value that is not indicated will be ignored
class AnswerDate extends AnswerResponse {
  AnswerDate(DateTime value) : super(value);
  @override
  void _setResponseItemType() => responseItemType = ItemType.date;
}

class AnswerDateTime extends AnswerResponse {
  AnswerDateTime(DateTime value) : super(value);
  @override
  void _setResponseItemType() => responseItemType = ItemType.dateTime;
}

class AnswerTime extends AnswerResponse {
  AnswerTime(DateTime value) : super(value);
  @override
  void _setResponseItemType() => responseItemType = ItemType.time;
}

/// for a Answer with a URL return value
class AnswerUrl extends AnswerResponse {
  AnswerUrl(Uri value) : super(value);
  @override
  void _setResponseItemType() => responseItemType = ItemType.url;
}

/// ToDo: the following three all have FHIR value return types which is not
/// something I want the front end to have to deal with, so I'll probably need
/// to come back and change these to strings
class AnswerAttachment extends AnswerResponse {
  AnswerAttachment(Attachment value) : super(value);
  @override
  void _setResponseItemType() => responseItemType = ItemType.attachment;
}

class AnswerReference extends AnswerResponse {
  AnswerReference(Reference value) : super(value);
  @override
  void _setResponseItemType() => responseItemType = ItemType.reference;
}

class AnswerQuantity extends AnswerResponse {
  AnswerQuantity(Quantity value) : super(value);
  @override
  void _setResponseItemType() => responseItemType = ItemType.quantity;
}
