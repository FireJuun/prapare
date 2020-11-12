// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ResponseTearOff {
  const _$ResponseTearOff();

// ignore: unused_element
  _Boolean boolean(bool value) {
    return _Boolean(
      value,
    );
  }

// ignore: unused_element
  _Decimal decimal(double value) {
    return _Decimal(
      value,
    );
  }

// ignore: unused_element
  _Integer integer(int value) {
    return _Integer(
      value,
    );
  }

// ignore: unused_element
  _String string(String value) {
    return _String(
      value,
    );
  }

// ignore: unused_element
  _Text text(String value) {
    return _Text(
      value,
    );
  }

// ignore: unused_element
  _Date date(DateTime value) {
    return _Date(
      value,
    );
  }

// ignore: unused_element
  _DateTime dateTime(DateTime value) {
    return _DateTime(
      value,
    );
  }

// ignore: unused_element
  _Time time(DateTime value) {
    return _Time(
      value,
    );
  }

// ignore: unused_element
  _Url url(Url value) {
    return _Url(
      value,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $Response = _$ResponseTearOff();

/// @nodoc
mixin _$Response {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result boolean(bool value),
    @required Result decimal(double value),
    @required Result integer(int value),
    @required Result string(String value),
    @required Result text(String value),
    @required Result date(DateTime value),
    @required Result dateTime(DateTime value),
    @required Result time(DateTime value),
    @required Result url(Url value),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result boolean(bool value),
    Result decimal(double value),
    Result integer(int value),
    Result string(String value),
    Result text(String value),
    Result date(DateTime value),
    Result dateTime(DateTime value),
    Result time(DateTime value),
    Result url(Url value),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result boolean(_Boolean value),
    @required Result decimal(_Decimal value),
    @required Result integer(_Integer value),
    @required Result string(_String value),
    @required Result text(_Text value),
    @required Result date(_Date value),
    @required Result dateTime(_DateTime value),
    @required Result time(_Time value),
    @required Result url(_Url value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result boolean(_Boolean value),
    Result decimal(_Decimal value),
    Result integer(_Integer value),
    Result string(_String value),
    Result text(_Text value),
    Result date(_Date value),
    Result dateTime(_DateTime value),
    Result time(_Time value),
    Result url(_Url value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $ResponseCopyWith<$Res> {
  factory $ResponseCopyWith(Response value, $Res Function(Response) then) =
      _$ResponseCopyWithImpl<$Res>;
}

/// @nodoc
class _$ResponseCopyWithImpl<$Res> implements $ResponseCopyWith<$Res> {
  _$ResponseCopyWithImpl(this._value, this._then);

  final Response _value;
  // ignore: unused_field
  final $Res Function(Response) _then;
}

/// @nodoc
abstract class _$BooleanCopyWith<$Res> {
  factory _$BooleanCopyWith(_Boolean value, $Res Function(_Boolean) then) =
      __$BooleanCopyWithImpl<$Res>;
  $Res call({bool value});
}

/// @nodoc
class __$BooleanCopyWithImpl<$Res> extends _$ResponseCopyWithImpl<$Res>
    implements _$BooleanCopyWith<$Res> {
  __$BooleanCopyWithImpl(_Boolean _value, $Res Function(_Boolean) _then)
      : super(_value, (v) => _then(v as _Boolean));

  @override
  _Boolean get _value => super._value as _Boolean;

  @override
  $Res call({
    Object value = freezed,
  }) {
    return _then(_Boolean(
      value == freezed ? _value.value : value as bool,
    ));
  }
}

/// @nodoc
class _$_Boolean implements _Boolean {
  _$_Boolean(this.value) : assert(value != null);

  @override
  final bool value;

  @override
  String toString() {
    return 'Response.boolean(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Boolean &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @override
  _$BooleanCopyWith<_Boolean> get copyWith =>
      __$BooleanCopyWithImpl<_Boolean>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result boolean(bool value),
    @required Result decimal(double value),
    @required Result integer(int value),
    @required Result string(String value),
    @required Result text(String value),
    @required Result date(DateTime value),
    @required Result dateTime(DateTime value),
    @required Result time(DateTime value),
    @required Result url(Url value),
  }) {
    assert(boolean != null);
    assert(decimal != null);
    assert(integer != null);
    assert(string != null);
    assert(text != null);
    assert(date != null);
    assert(dateTime != null);
    assert(time != null);
    assert(url != null);
    return boolean(value);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result boolean(bool value),
    Result decimal(double value),
    Result integer(int value),
    Result string(String value),
    Result text(String value),
    Result date(DateTime value),
    Result dateTime(DateTime value),
    Result time(DateTime value),
    Result url(Url value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (boolean != null) {
      return boolean(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result boolean(_Boolean value),
    @required Result decimal(_Decimal value),
    @required Result integer(_Integer value),
    @required Result string(_String value),
    @required Result text(_Text value),
    @required Result date(_Date value),
    @required Result dateTime(_DateTime value),
    @required Result time(_Time value),
    @required Result url(_Url value),
  }) {
    assert(boolean != null);
    assert(decimal != null);
    assert(integer != null);
    assert(string != null);
    assert(text != null);
    assert(date != null);
    assert(dateTime != null);
    assert(time != null);
    assert(url != null);
    return boolean(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result boolean(_Boolean value),
    Result decimal(_Decimal value),
    Result integer(_Integer value),
    Result string(_String value),
    Result text(_Text value),
    Result date(_Date value),
    Result dateTime(_DateTime value),
    Result time(_Time value),
    Result url(_Url value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (boolean != null) {
      return boolean(this);
    }
    return orElse();
  }
}

abstract class _Boolean implements Response {
  factory _Boolean(bool value) = _$_Boolean;

  bool get value;
  _$BooleanCopyWith<_Boolean> get copyWith;
}

/// @nodoc
abstract class _$DecimalCopyWith<$Res> {
  factory _$DecimalCopyWith(_Decimal value, $Res Function(_Decimal) then) =
      __$DecimalCopyWithImpl<$Res>;
  $Res call({double value});
}

/// @nodoc
class __$DecimalCopyWithImpl<$Res> extends _$ResponseCopyWithImpl<$Res>
    implements _$DecimalCopyWith<$Res> {
  __$DecimalCopyWithImpl(_Decimal _value, $Res Function(_Decimal) _then)
      : super(_value, (v) => _then(v as _Decimal));

  @override
  _Decimal get _value => super._value as _Decimal;

  @override
  $Res call({
    Object value = freezed,
  }) {
    return _then(_Decimal(
      value == freezed ? _value.value : value as double,
    ));
  }
}

/// @nodoc
class _$_Decimal implements _Decimal {
  _$_Decimal(this.value) : assert(value != null);

  @override
  final double value;

  @override
  String toString() {
    return 'Response.decimal(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Decimal &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @override
  _$DecimalCopyWith<_Decimal> get copyWith =>
      __$DecimalCopyWithImpl<_Decimal>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result boolean(bool value),
    @required Result decimal(double value),
    @required Result integer(int value),
    @required Result string(String value),
    @required Result text(String value),
    @required Result date(DateTime value),
    @required Result dateTime(DateTime value),
    @required Result time(DateTime value),
    @required Result url(Url value),
  }) {
    assert(boolean != null);
    assert(decimal != null);
    assert(integer != null);
    assert(string != null);
    assert(text != null);
    assert(date != null);
    assert(dateTime != null);
    assert(time != null);
    assert(url != null);
    return decimal(value);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result boolean(bool value),
    Result decimal(double value),
    Result integer(int value),
    Result string(String value),
    Result text(String value),
    Result date(DateTime value),
    Result dateTime(DateTime value),
    Result time(DateTime value),
    Result url(Url value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (decimal != null) {
      return decimal(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result boolean(_Boolean value),
    @required Result decimal(_Decimal value),
    @required Result integer(_Integer value),
    @required Result string(_String value),
    @required Result text(_Text value),
    @required Result date(_Date value),
    @required Result dateTime(_DateTime value),
    @required Result time(_Time value),
    @required Result url(_Url value),
  }) {
    assert(boolean != null);
    assert(decimal != null);
    assert(integer != null);
    assert(string != null);
    assert(text != null);
    assert(date != null);
    assert(dateTime != null);
    assert(time != null);
    assert(url != null);
    return decimal(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result boolean(_Boolean value),
    Result decimal(_Decimal value),
    Result integer(_Integer value),
    Result string(_String value),
    Result text(_Text value),
    Result date(_Date value),
    Result dateTime(_DateTime value),
    Result time(_Time value),
    Result url(_Url value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (decimal != null) {
      return decimal(this);
    }
    return orElse();
  }
}

abstract class _Decimal implements Response {
  factory _Decimal(double value) = _$_Decimal;

  double get value;
  _$DecimalCopyWith<_Decimal> get copyWith;
}

/// @nodoc
abstract class _$IntegerCopyWith<$Res> {
  factory _$IntegerCopyWith(_Integer value, $Res Function(_Integer) then) =
      __$IntegerCopyWithImpl<$Res>;
  $Res call({int value});
}

/// @nodoc
class __$IntegerCopyWithImpl<$Res> extends _$ResponseCopyWithImpl<$Res>
    implements _$IntegerCopyWith<$Res> {
  __$IntegerCopyWithImpl(_Integer _value, $Res Function(_Integer) _then)
      : super(_value, (v) => _then(v as _Integer));

  @override
  _Integer get _value => super._value as _Integer;

  @override
  $Res call({
    Object value = freezed,
  }) {
    return _then(_Integer(
      value == freezed ? _value.value : value as int,
    ));
  }
}

/// @nodoc
class _$_Integer implements _Integer {
  _$_Integer(this.value) : assert(value != null);

  @override
  final int value;

  @override
  String toString() {
    return 'Response.integer(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Integer &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @override
  _$IntegerCopyWith<_Integer> get copyWith =>
      __$IntegerCopyWithImpl<_Integer>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result boolean(bool value),
    @required Result decimal(double value),
    @required Result integer(int value),
    @required Result string(String value),
    @required Result text(String value),
    @required Result date(DateTime value),
    @required Result dateTime(DateTime value),
    @required Result time(DateTime value),
    @required Result url(Url value),
  }) {
    assert(boolean != null);
    assert(decimal != null);
    assert(integer != null);
    assert(string != null);
    assert(text != null);
    assert(date != null);
    assert(dateTime != null);
    assert(time != null);
    assert(url != null);
    return integer(value);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result boolean(bool value),
    Result decimal(double value),
    Result integer(int value),
    Result string(String value),
    Result text(String value),
    Result date(DateTime value),
    Result dateTime(DateTime value),
    Result time(DateTime value),
    Result url(Url value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (integer != null) {
      return integer(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result boolean(_Boolean value),
    @required Result decimal(_Decimal value),
    @required Result integer(_Integer value),
    @required Result string(_String value),
    @required Result text(_Text value),
    @required Result date(_Date value),
    @required Result dateTime(_DateTime value),
    @required Result time(_Time value),
    @required Result url(_Url value),
  }) {
    assert(boolean != null);
    assert(decimal != null);
    assert(integer != null);
    assert(string != null);
    assert(text != null);
    assert(date != null);
    assert(dateTime != null);
    assert(time != null);
    assert(url != null);
    return integer(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result boolean(_Boolean value),
    Result decimal(_Decimal value),
    Result integer(_Integer value),
    Result string(_String value),
    Result text(_Text value),
    Result date(_Date value),
    Result dateTime(_DateTime value),
    Result time(_Time value),
    Result url(_Url value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (integer != null) {
      return integer(this);
    }
    return orElse();
  }
}

abstract class _Integer implements Response {
  factory _Integer(int value) = _$_Integer;

  int get value;
  _$IntegerCopyWith<_Integer> get copyWith;
}

/// @nodoc
abstract class _$StringCopyWith<$Res> {
  factory _$StringCopyWith(_String value, $Res Function(_String) then) =
      __$StringCopyWithImpl<$Res>;
  $Res call({String value});
}

/// @nodoc
class __$StringCopyWithImpl<$Res> extends _$ResponseCopyWithImpl<$Res>
    implements _$StringCopyWith<$Res> {
  __$StringCopyWithImpl(_String _value, $Res Function(_String) _then)
      : super(_value, (v) => _then(v as _String));

  @override
  _String get _value => super._value as _String;

  @override
  $Res call({
    Object value = freezed,
  }) {
    return _then(_String(
      value == freezed ? _value.value : value as String,
    ));
  }
}

/// @nodoc
class _$_String implements _String {
  _$_String(this.value) : assert(value != null);

  @override
  final String value;

  @override
  String toString() {
    return 'Response.string(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _String &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @override
  _$StringCopyWith<_String> get copyWith =>
      __$StringCopyWithImpl<_String>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result boolean(bool value),
    @required Result decimal(double value),
    @required Result integer(int value),
    @required Result string(String value),
    @required Result text(String value),
    @required Result date(DateTime value),
    @required Result dateTime(DateTime value),
    @required Result time(DateTime value),
    @required Result url(Url value),
  }) {
    assert(boolean != null);
    assert(decimal != null);
    assert(integer != null);
    assert(string != null);
    assert(text != null);
    assert(date != null);
    assert(dateTime != null);
    assert(time != null);
    assert(url != null);
    return string(value);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result boolean(bool value),
    Result decimal(double value),
    Result integer(int value),
    Result string(String value),
    Result text(String value),
    Result date(DateTime value),
    Result dateTime(DateTime value),
    Result time(DateTime value),
    Result url(Url value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (string != null) {
      return string(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result boolean(_Boolean value),
    @required Result decimal(_Decimal value),
    @required Result integer(_Integer value),
    @required Result string(_String value),
    @required Result text(_Text value),
    @required Result date(_Date value),
    @required Result dateTime(_DateTime value),
    @required Result time(_Time value),
    @required Result url(_Url value),
  }) {
    assert(boolean != null);
    assert(decimal != null);
    assert(integer != null);
    assert(string != null);
    assert(text != null);
    assert(date != null);
    assert(dateTime != null);
    assert(time != null);
    assert(url != null);
    return string(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result boolean(_Boolean value),
    Result decimal(_Decimal value),
    Result integer(_Integer value),
    Result string(_String value),
    Result text(_Text value),
    Result date(_Date value),
    Result dateTime(_DateTime value),
    Result time(_Time value),
    Result url(_Url value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (string != null) {
      return string(this);
    }
    return orElse();
  }
}

abstract class _String implements Response {
  factory _String(String value) = _$_String;

  String get value;
  _$StringCopyWith<_String> get copyWith;
}

/// @nodoc
abstract class _$TextCopyWith<$Res> {
  factory _$TextCopyWith(_Text value, $Res Function(_Text) then) =
      __$TextCopyWithImpl<$Res>;
  $Res call({String value});
}

/// @nodoc
class __$TextCopyWithImpl<$Res> extends _$ResponseCopyWithImpl<$Res>
    implements _$TextCopyWith<$Res> {
  __$TextCopyWithImpl(_Text _value, $Res Function(_Text) _then)
      : super(_value, (v) => _then(v as _Text));

  @override
  _Text get _value => super._value as _Text;

  @override
  $Res call({
    Object value = freezed,
  }) {
    return _then(_Text(
      value == freezed ? _value.value : value as String,
    ));
  }
}

/// @nodoc
class _$_Text implements _Text {
  _$_Text(this.value) : assert(value != null);

  @override
  final String value;

  @override
  String toString() {
    return 'Response.text(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Text &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @override
  _$TextCopyWith<_Text> get copyWith =>
      __$TextCopyWithImpl<_Text>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result boolean(bool value),
    @required Result decimal(double value),
    @required Result integer(int value),
    @required Result string(String value),
    @required Result text(String value),
    @required Result date(DateTime value),
    @required Result dateTime(DateTime value),
    @required Result time(DateTime value),
    @required Result url(Url value),
  }) {
    assert(boolean != null);
    assert(decimal != null);
    assert(integer != null);
    assert(string != null);
    assert(text != null);
    assert(date != null);
    assert(dateTime != null);
    assert(time != null);
    assert(url != null);
    return text(value);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result boolean(bool value),
    Result decimal(double value),
    Result integer(int value),
    Result string(String value),
    Result text(String value),
    Result date(DateTime value),
    Result dateTime(DateTime value),
    Result time(DateTime value),
    Result url(Url value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (text != null) {
      return text(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result boolean(_Boolean value),
    @required Result decimal(_Decimal value),
    @required Result integer(_Integer value),
    @required Result string(_String value),
    @required Result text(_Text value),
    @required Result date(_Date value),
    @required Result dateTime(_DateTime value),
    @required Result time(_Time value),
    @required Result url(_Url value),
  }) {
    assert(boolean != null);
    assert(decimal != null);
    assert(integer != null);
    assert(string != null);
    assert(text != null);
    assert(date != null);
    assert(dateTime != null);
    assert(time != null);
    assert(url != null);
    return text(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result boolean(_Boolean value),
    Result decimal(_Decimal value),
    Result integer(_Integer value),
    Result string(_String value),
    Result text(_Text value),
    Result date(_Date value),
    Result dateTime(_DateTime value),
    Result time(_Time value),
    Result url(_Url value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (text != null) {
      return text(this);
    }
    return orElse();
  }
}

abstract class _Text implements Response {
  factory _Text(String value) = _$_Text;

  String get value;
  _$TextCopyWith<_Text> get copyWith;
}

/// @nodoc
abstract class _$DateCopyWith<$Res> {
  factory _$DateCopyWith(_Date value, $Res Function(_Date) then) =
      __$DateCopyWithImpl<$Res>;
  $Res call({DateTime value});
}

/// @nodoc
class __$DateCopyWithImpl<$Res> extends _$ResponseCopyWithImpl<$Res>
    implements _$DateCopyWith<$Res> {
  __$DateCopyWithImpl(_Date _value, $Res Function(_Date) _then)
      : super(_value, (v) => _then(v as _Date));

  @override
  _Date get _value => super._value as _Date;

  @override
  $Res call({
    Object value = freezed,
  }) {
    return _then(_Date(
      value == freezed ? _value.value : value as DateTime,
    ));
  }
}

/// @nodoc
class _$_Date implements _Date {
  _$_Date(this.value) : assert(value != null);

  @override
  final DateTime value;

  @override
  String toString() {
    return 'Response.date(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Date &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @override
  _$DateCopyWith<_Date> get copyWith =>
      __$DateCopyWithImpl<_Date>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result boolean(bool value),
    @required Result decimal(double value),
    @required Result integer(int value),
    @required Result string(String value),
    @required Result text(String value),
    @required Result date(DateTime value),
    @required Result dateTime(DateTime value),
    @required Result time(DateTime value),
    @required Result url(Url value),
  }) {
    assert(boolean != null);
    assert(decimal != null);
    assert(integer != null);
    assert(string != null);
    assert(text != null);
    assert(date != null);
    assert(dateTime != null);
    assert(time != null);
    assert(url != null);
    return date(value);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result boolean(bool value),
    Result decimal(double value),
    Result integer(int value),
    Result string(String value),
    Result text(String value),
    Result date(DateTime value),
    Result dateTime(DateTime value),
    Result time(DateTime value),
    Result url(Url value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (date != null) {
      return date(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result boolean(_Boolean value),
    @required Result decimal(_Decimal value),
    @required Result integer(_Integer value),
    @required Result string(_String value),
    @required Result text(_Text value),
    @required Result date(_Date value),
    @required Result dateTime(_DateTime value),
    @required Result time(_Time value),
    @required Result url(_Url value),
  }) {
    assert(boolean != null);
    assert(decimal != null);
    assert(integer != null);
    assert(string != null);
    assert(text != null);
    assert(date != null);
    assert(dateTime != null);
    assert(time != null);
    assert(url != null);
    return date(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result boolean(_Boolean value),
    Result decimal(_Decimal value),
    Result integer(_Integer value),
    Result string(_String value),
    Result text(_Text value),
    Result date(_Date value),
    Result dateTime(_DateTime value),
    Result time(_Time value),
    Result url(_Url value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (date != null) {
      return date(this);
    }
    return orElse();
  }
}

abstract class _Date implements Response {
  factory _Date(DateTime value) = _$_Date;

  DateTime get value;
  _$DateCopyWith<_Date> get copyWith;
}

/// @nodoc
abstract class _$DateTimeCopyWith<$Res> {
  factory _$DateTimeCopyWith(_DateTime value, $Res Function(_DateTime) then) =
      __$DateTimeCopyWithImpl<$Res>;
  $Res call({DateTime value});
}

/// @nodoc
class __$DateTimeCopyWithImpl<$Res> extends _$ResponseCopyWithImpl<$Res>
    implements _$DateTimeCopyWith<$Res> {
  __$DateTimeCopyWithImpl(_DateTime _value, $Res Function(_DateTime) _then)
      : super(_value, (v) => _then(v as _DateTime));

  @override
  _DateTime get _value => super._value as _DateTime;

  @override
  $Res call({
    Object value = freezed,
  }) {
    return _then(_DateTime(
      value == freezed ? _value.value : value as DateTime,
    ));
  }
}

/// @nodoc
class _$_DateTime implements _DateTime {
  _$_DateTime(this.value) : assert(value != null);

  @override
  final DateTime value;

  @override
  String toString() {
    return 'Response.dateTime(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DateTime &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @override
  _$DateTimeCopyWith<_DateTime> get copyWith =>
      __$DateTimeCopyWithImpl<_DateTime>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result boolean(bool value),
    @required Result decimal(double value),
    @required Result integer(int value),
    @required Result string(String value),
    @required Result text(String value),
    @required Result date(DateTime value),
    @required Result dateTime(DateTime value),
    @required Result time(DateTime value),
    @required Result url(Url value),
  }) {
    assert(boolean != null);
    assert(decimal != null);
    assert(integer != null);
    assert(string != null);
    assert(text != null);
    assert(date != null);
    assert(dateTime != null);
    assert(time != null);
    assert(url != null);
    return dateTime(value);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result boolean(bool value),
    Result decimal(double value),
    Result integer(int value),
    Result string(String value),
    Result text(String value),
    Result date(DateTime value),
    Result dateTime(DateTime value),
    Result time(DateTime value),
    Result url(Url value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (dateTime != null) {
      return dateTime(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result boolean(_Boolean value),
    @required Result decimal(_Decimal value),
    @required Result integer(_Integer value),
    @required Result string(_String value),
    @required Result text(_Text value),
    @required Result date(_Date value),
    @required Result dateTime(_DateTime value),
    @required Result time(_Time value),
    @required Result url(_Url value),
  }) {
    assert(boolean != null);
    assert(decimal != null);
    assert(integer != null);
    assert(string != null);
    assert(text != null);
    assert(date != null);
    assert(dateTime != null);
    assert(time != null);
    assert(url != null);
    return dateTime(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result boolean(_Boolean value),
    Result decimal(_Decimal value),
    Result integer(_Integer value),
    Result string(_String value),
    Result text(_Text value),
    Result date(_Date value),
    Result dateTime(_DateTime value),
    Result time(_Time value),
    Result url(_Url value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (dateTime != null) {
      return dateTime(this);
    }
    return orElse();
  }
}

abstract class _DateTime implements Response {
  factory _DateTime(DateTime value) = _$_DateTime;

  DateTime get value;
  _$DateTimeCopyWith<_DateTime> get copyWith;
}

/// @nodoc
abstract class _$TimeCopyWith<$Res> {
  factory _$TimeCopyWith(_Time value, $Res Function(_Time) then) =
      __$TimeCopyWithImpl<$Res>;
  $Res call({DateTime value});
}

/// @nodoc
class __$TimeCopyWithImpl<$Res> extends _$ResponseCopyWithImpl<$Res>
    implements _$TimeCopyWith<$Res> {
  __$TimeCopyWithImpl(_Time _value, $Res Function(_Time) _then)
      : super(_value, (v) => _then(v as _Time));

  @override
  _Time get _value => super._value as _Time;

  @override
  $Res call({
    Object value = freezed,
  }) {
    return _then(_Time(
      value == freezed ? _value.value : value as DateTime,
    ));
  }
}

/// @nodoc
class _$_Time implements _Time {
  _$_Time(this.value) : assert(value != null);

  @override
  final DateTime value;

  @override
  String toString() {
    return 'Response.time(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Time &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @override
  _$TimeCopyWith<_Time> get copyWith =>
      __$TimeCopyWithImpl<_Time>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result boolean(bool value),
    @required Result decimal(double value),
    @required Result integer(int value),
    @required Result string(String value),
    @required Result text(String value),
    @required Result date(DateTime value),
    @required Result dateTime(DateTime value),
    @required Result time(DateTime value),
    @required Result url(Url value),
  }) {
    assert(boolean != null);
    assert(decimal != null);
    assert(integer != null);
    assert(string != null);
    assert(text != null);
    assert(date != null);
    assert(dateTime != null);
    assert(time != null);
    assert(url != null);
    return time(value);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result boolean(bool value),
    Result decimal(double value),
    Result integer(int value),
    Result string(String value),
    Result text(String value),
    Result date(DateTime value),
    Result dateTime(DateTime value),
    Result time(DateTime value),
    Result url(Url value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (time != null) {
      return time(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result boolean(_Boolean value),
    @required Result decimal(_Decimal value),
    @required Result integer(_Integer value),
    @required Result string(_String value),
    @required Result text(_Text value),
    @required Result date(_Date value),
    @required Result dateTime(_DateTime value),
    @required Result time(_Time value),
    @required Result url(_Url value),
  }) {
    assert(boolean != null);
    assert(decimal != null);
    assert(integer != null);
    assert(string != null);
    assert(text != null);
    assert(date != null);
    assert(dateTime != null);
    assert(time != null);
    assert(url != null);
    return time(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result boolean(_Boolean value),
    Result decimal(_Decimal value),
    Result integer(_Integer value),
    Result string(_String value),
    Result text(_Text value),
    Result date(_Date value),
    Result dateTime(_DateTime value),
    Result time(_Time value),
    Result url(_Url value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (time != null) {
      return time(this);
    }
    return orElse();
  }
}

abstract class _Time implements Response {
  factory _Time(DateTime value) = _$_Time;

  DateTime get value;
  _$TimeCopyWith<_Time> get copyWith;
}

/// @nodoc
abstract class _$UrlCopyWith<$Res> {
  factory _$UrlCopyWith(_Url value, $Res Function(_Url) then) =
      __$UrlCopyWithImpl<$Res>;
  $Res call({Url value});
}

/// @nodoc
class __$UrlCopyWithImpl<$Res> extends _$ResponseCopyWithImpl<$Res>
    implements _$UrlCopyWith<$Res> {
  __$UrlCopyWithImpl(_Url _value, $Res Function(_Url) _then)
      : super(_value, (v) => _then(v as _Url));

  @override
  _Url get _value => super._value as _Url;

  @override
  $Res call({
    Object value = freezed,
  }) {
    return _then(_Url(
      value == freezed ? _value.value : value as Url,
    ));
  }
}

/// @nodoc
class _$_Url implements _Url {
  _$_Url(this.value) : assert(value != null);

  @override
  final Url value;

  @override
  String toString() {
    return 'Response.url(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Url &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @override
  _$UrlCopyWith<_Url> get copyWith =>
      __$UrlCopyWithImpl<_Url>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result boolean(bool value),
    @required Result decimal(double value),
    @required Result integer(int value),
    @required Result string(String value),
    @required Result text(String value),
    @required Result date(DateTime value),
    @required Result dateTime(DateTime value),
    @required Result time(DateTime value),
    @required Result url(Url value),
  }) {
    assert(boolean != null);
    assert(decimal != null);
    assert(integer != null);
    assert(string != null);
    assert(text != null);
    assert(date != null);
    assert(dateTime != null);
    assert(time != null);
    assert(url != null);
    return url(value);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result boolean(bool value),
    Result decimal(double value),
    Result integer(int value),
    Result string(String value),
    Result text(String value),
    Result date(DateTime value),
    Result dateTime(DateTime value),
    Result time(DateTime value),
    Result url(Url value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (url != null) {
      return url(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result boolean(_Boolean value),
    @required Result decimal(_Decimal value),
    @required Result integer(_Integer value),
    @required Result string(_String value),
    @required Result text(_Text value),
    @required Result date(_Date value),
    @required Result dateTime(_DateTime value),
    @required Result time(_Time value),
    @required Result url(_Url value),
  }) {
    assert(boolean != null);
    assert(decimal != null);
    assert(integer != null);
    assert(string != null);
    assert(text != null);
    assert(date != null);
    assert(dateTime != null);
    assert(time != null);
    assert(url != null);
    return url(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result boolean(_Boolean value),
    Result decimal(_Decimal value),
    Result integer(_Integer value),
    Result string(_String value),
    Result text(_Text value),
    Result date(_Date value),
    Result dateTime(_DateTime value),
    Result time(_Time value),
    Result url(_Url value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (url != null) {
      return url(this);
    }
    return orElse();
  }
}

abstract class _Url implements Response {
  factory _Url(Url value) = _$_Url;

  Url get value;
  _$UrlCopyWith<_Url> get copyWith;
}
