abstract class ResponseType {
  ResponseType(this.value);
  dynamic value;
}

//   /// In some cases, boolean answers are accepted
class ResponseBoolean extends ResponseType {
  ResponseBoolean(bool value) : super(value);
}

//   /// In other cases, decimals are accepted
//   /// While FHIR accepts this resource as a decimal...
//   /// Our current data elements only needs integers
class ResponseDecimal extends ResponseType {
  ResponseDecimal(double value) : super(value);
}

class ResponseInteger extends ResponseType {
  ResponseInteger(int value) : super(value);
}

//   /// for any generic case that needs a string (should be short)
class ResponseString extends ResponseType {
  ResponseString(String value) : super(value);
}

//   /// for any generic case that needs a string, but can be long
class ResponseText extends ResponseType {
  ResponseText(String value) : super(value);
}

//   /// Dates, DateTimes and Times respectively, they will be parsed and any part
//   /// of the value that is not indicated will be ignored
class ResponseDate extends ResponseType {
  ResponseDate(DateTime value) : super(value);
}

class ResponseDateTime extends ResponseType {
  ResponseDateTime(DateTime value) : super(value);
}

class ResponseTime extends ResponseType {
  ResponseTime(DateTime value) : super(value);
}

/// for a response with a URL return value
class ResponseUrl extends ResponseType {
  ResponseUrl(Uri value) : super(value);
}
