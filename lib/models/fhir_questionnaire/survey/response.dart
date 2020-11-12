import 'dart:html';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'response.freezed.dart';

@freezed
abstract class Response with _$Response {
  /// In some cases, boolean answers are accepted
  factory Response.boolean(bool value) = _Boolean;

  /// In other cases, decimals are accepted
  /// While FHIR accepts this resource as a decimal...
  /// Our current data elements only needs integers
  factory Response.decimal(double value) = _Decimal;
  factory Response.integer(int value) = _Integer;

  /// for any generic case that needs a string (should be short)
  factory Response.string(String value) = _String;

  /// for any generic case that needs a string, but can be long
  factory Response.text(String value) = _Text;

  /// Dates, DateTimes and Times respectively, they will be parsed and any part
  /// of the value that is not indicated will be ignored
  factory Response.date(DateTime value) = _Date;
  factory Response.dateTime(DateTime value) = _DateTime;
  factory Response.time(DateTime value) = _Time;

  factory Response.url(Url value) = _Url;
}
