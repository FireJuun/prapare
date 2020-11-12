import 'dart:html';

class ResponseType {
  ResponseType(this.value);

  /// In some cases, boolean answers are accepted
  factory ResponseType.boolean(bool value) => ResponseType(value);

  /// In other cases, decimals are accepted
  /// While FHIR accepts this resource as a decimal...
  /// Our current data elements only needs integers
  factory ResponseType.decimal(double value) => ResponseType(value);
  factory ResponseType.integer(int value) => ResponseType(value);

  /// for any generic case that needs a string (should be short)
  factory ResponseType.string(String value) => ResponseType(value);

  /// for any generic case that needs a string, but can be long
  factory ResponseType.text(String value) => ResponseType(value);

  /// Dates, DateTimes and Times respectively, they will be parsed and any part
  /// of the value that is not indicated will be ignored
  factory ResponseType.date(DateTime value) => ResponseType(value);
  factory ResponseType.dateTime(DateTime value) => ResponseType(value);
  factory ResponseType.time(DateTime value) => ResponseType(value);

  factory ResponseType.url(Url value) => ResponseType(value);

  dynamic value;
}
