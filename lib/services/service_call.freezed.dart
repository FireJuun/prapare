// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'service_call.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ServiceCallTearOff {
  const _$ServiceCallTearOff();

// ignore: unused_element
  _Aidbox aidboxService(
      {FhirClient client, Bundle bundle, Rx<RemoteState> state}) {
    return _Aidbox(
      client: client,
      bundle: bundle,
      state: state,
    );
  }

// ignore: unused_element
  _Hapi hapiService({Bundle bundle, Rx<RemoteState> state}) {
    return _Hapi(
      bundle: bundle,
      state: state,
    );
  }

// ignore: unused_element
  _LocalStorage localStorageService({Bundle bundle, Rx<RemoteState> state}) {
    return _LocalStorage(
      bundle: bundle,
      state: state,
    );
  }

// ignore: unused_element
  _LocalDisplay localDisplayService({Bundle bundle, Rx<RemoteState> state}) {
    return _LocalDisplay(
      bundle: bundle,
      state: state,
    );
  }

// ignore: unused_element
  _Mihin mihinService({FhirClient client, Rx<RemoteState> state}) {
    return _Mihin(
      client: client,
      state: state,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ServiceCall = _$ServiceCallTearOff();

/// @nodoc
mixin _$ServiceCall {
  Rx<RemoteState> get state;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result aidboxService(
            FhirClient client, Bundle bundle, Rx<RemoteState> state),
    @required Result hapiService(Bundle bundle, Rx<RemoteState> state),
    @required Result localStorageService(Bundle bundle, Rx<RemoteState> state),
    @required Result localDisplayService(Bundle bundle, Rx<RemoteState> state),
    @required Result mihinService(FhirClient client, Rx<RemoteState> state),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result aidboxService(
        FhirClient client, Bundle bundle, Rx<RemoteState> state),
    Result hapiService(Bundle bundle, Rx<RemoteState> state),
    Result localStorageService(Bundle bundle, Rx<RemoteState> state),
    Result localDisplayService(Bundle bundle, Rx<RemoteState> state),
    Result mihinService(FhirClient client, Rx<RemoteState> state),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result aidboxService(_Aidbox value),
    @required Result hapiService(_Hapi value),
    @required Result localStorageService(_LocalStorage value),
    @required Result localDisplayService(_LocalDisplay value),
    @required Result mihinService(_Mihin value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result aidboxService(_Aidbox value),
    Result hapiService(_Hapi value),
    Result localStorageService(_LocalStorage value),
    Result localDisplayService(_LocalDisplay value),
    Result mihinService(_Mihin value),
    @required Result orElse(),
  });

  $ServiceCallCopyWith<ServiceCall> get copyWith;
}

/// @nodoc
abstract class $ServiceCallCopyWith<$Res> {
  factory $ServiceCallCopyWith(
          ServiceCall value, $Res Function(ServiceCall) then) =
      _$ServiceCallCopyWithImpl<$Res>;
  $Res call({Rx<RemoteState> state});
}

/// @nodoc
class _$ServiceCallCopyWithImpl<$Res> implements $ServiceCallCopyWith<$Res> {
  _$ServiceCallCopyWithImpl(this._value, this._then);

  final ServiceCall _value;
  // ignore: unused_field
  final $Res Function(ServiceCall) _then;

  @override
  $Res call({
    Object state = freezed,
  }) {
    return _then(_value.copyWith(
      state: state == freezed ? _value.state : state as Rx<RemoteState>,
    ));
  }
}

/// @nodoc
abstract class _$AidboxCopyWith<$Res> implements $ServiceCallCopyWith<$Res> {
  factory _$AidboxCopyWith(_Aidbox value, $Res Function(_Aidbox) then) =
      __$AidboxCopyWithImpl<$Res>;
  @override
  $Res call({FhirClient client, Bundle bundle, Rx<RemoteState> state});

  $BundleCopyWith<$Res> get bundle;
}

/// @nodoc
class __$AidboxCopyWithImpl<$Res> extends _$ServiceCallCopyWithImpl<$Res>
    implements _$AidboxCopyWith<$Res> {
  __$AidboxCopyWithImpl(_Aidbox _value, $Res Function(_Aidbox) _then)
      : super(_value, (v) => _then(v as _Aidbox));

  @override
  _Aidbox get _value => super._value as _Aidbox;

  @override
  $Res call({
    Object client = freezed,
    Object bundle = freezed,
    Object state = freezed,
  }) {
    return _then(_Aidbox(
      client: client == freezed ? _value.client : client as FhirClient,
      bundle: bundle == freezed ? _value.bundle : bundle as Bundle,
      state: state == freezed ? _value.state : state as Rx<RemoteState>,
    ));
  }

  @override
  $BundleCopyWith<$Res> get bundle {
    if (_value.bundle == null) {
      return null;
    }
    return $BundleCopyWith<$Res>(_value.bundle, (value) {
      return _then(_value.copyWith(bundle: value));
    });
  }
}

/// @nodoc
class _$_Aidbox extends _Aidbox {
  _$_Aidbox({this.client, this.bundle, this.state}) : super._();

  @override
  final FhirClient client;
  @override
  final Bundle bundle;
  @override
  final Rx<RemoteState> state;

  @override
  String toString() {
    return 'ServiceCall.aidboxService(client: $client, bundle: $bundle, state: $state)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Aidbox &&
            (identical(other.client, client) ||
                const DeepCollectionEquality().equals(other.client, client)) &&
            (identical(other.bundle, bundle) ||
                const DeepCollectionEquality().equals(other.bundle, bundle)) &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(client) ^
      const DeepCollectionEquality().hash(bundle) ^
      const DeepCollectionEquality().hash(state);

  @override
  _$AidboxCopyWith<_Aidbox> get copyWith =>
      __$AidboxCopyWithImpl<_Aidbox>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result aidboxService(
            FhirClient client, Bundle bundle, Rx<RemoteState> state),
    @required Result hapiService(Bundle bundle, Rx<RemoteState> state),
    @required Result localStorageService(Bundle bundle, Rx<RemoteState> state),
    @required Result localDisplayService(Bundle bundle, Rx<RemoteState> state),
    @required Result mihinService(FhirClient client, Rx<RemoteState> state),
  }) {
    assert(aidboxService != null);
    assert(hapiService != null);
    assert(localStorageService != null);
    assert(localDisplayService != null);
    assert(mihinService != null);
    return aidboxService(client, bundle, state);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result aidboxService(
        FhirClient client, Bundle bundle, Rx<RemoteState> state),
    Result hapiService(Bundle bundle, Rx<RemoteState> state),
    Result localStorageService(Bundle bundle, Rx<RemoteState> state),
    Result localDisplayService(Bundle bundle, Rx<RemoteState> state),
    Result mihinService(FhirClient client, Rx<RemoteState> state),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (aidboxService != null) {
      return aidboxService(client, bundle, state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result aidboxService(_Aidbox value),
    @required Result hapiService(_Hapi value),
    @required Result localStorageService(_LocalStorage value),
    @required Result localDisplayService(_LocalDisplay value),
    @required Result mihinService(_Mihin value),
  }) {
    assert(aidboxService != null);
    assert(hapiService != null);
    assert(localStorageService != null);
    assert(localDisplayService != null);
    assert(mihinService != null);
    return aidboxService(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result aidboxService(_Aidbox value),
    Result hapiService(_Hapi value),
    Result localStorageService(_LocalStorage value),
    Result localDisplayService(_LocalDisplay value),
    Result mihinService(_Mihin value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (aidboxService != null) {
      return aidboxService(this);
    }
    return orElse();
  }
}

abstract class _Aidbox extends ServiceCall {
  _Aidbox._() : super._();
  factory _Aidbox({FhirClient client, Bundle bundle, Rx<RemoteState> state}) =
      _$_Aidbox;

  FhirClient get client;
  Bundle get bundle;
  @override
  Rx<RemoteState> get state;
  @override
  _$AidboxCopyWith<_Aidbox> get copyWith;
}

/// @nodoc
abstract class _$HapiCopyWith<$Res> implements $ServiceCallCopyWith<$Res> {
  factory _$HapiCopyWith(_Hapi value, $Res Function(_Hapi) then) =
      __$HapiCopyWithImpl<$Res>;
  @override
  $Res call({Bundle bundle, Rx<RemoteState> state});

  $BundleCopyWith<$Res> get bundle;
}

/// @nodoc
class __$HapiCopyWithImpl<$Res> extends _$ServiceCallCopyWithImpl<$Res>
    implements _$HapiCopyWith<$Res> {
  __$HapiCopyWithImpl(_Hapi _value, $Res Function(_Hapi) _then)
      : super(_value, (v) => _then(v as _Hapi));

  @override
  _Hapi get _value => super._value as _Hapi;

  @override
  $Res call({
    Object bundle = freezed,
    Object state = freezed,
  }) {
    return _then(_Hapi(
      bundle: bundle == freezed ? _value.bundle : bundle as Bundle,
      state: state == freezed ? _value.state : state as Rx<RemoteState>,
    ));
  }

  @override
  $BundleCopyWith<$Res> get bundle {
    if (_value.bundle == null) {
      return null;
    }
    return $BundleCopyWith<$Res>(_value.bundle, (value) {
      return _then(_value.copyWith(bundle: value));
    });
  }
}

/// @nodoc
class _$_Hapi extends _Hapi {
  _$_Hapi({this.bundle, this.state}) : super._();

  @override
  final Bundle bundle;
  @override
  final Rx<RemoteState> state;

  @override
  String toString() {
    return 'ServiceCall.hapiService(bundle: $bundle, state: $state)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Hapi &&
            (identical(other.bundle, bundle) ||
                const DeepCollectionEquality().equals(other.bundle, bundle)) &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(bundle) ^
      const DeepCollectionEquality().hash(state);

  @override
  _$HapiCopyWith<_Hapi> get copyWith =>
      __$HapiCopyWithImpl<_Hapi>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result aidboxService(
            FhirClient client, Bundle bundle, Rx<RemoteState> state),
    @required Result hapiService(Bundle bundle, Rx<RemoteState> state),
    @required Result localStorageService(Bundle bundle, Rx<RemoteState> state),
    @required Result localDisplayService(Bundle bundle, Rx<RemoteState> state),
    @required Result mihinService(FhirClient client, Rx<RemoteState> state),
  }) {
    assert(aidboxService != null);
    assert(hapiService != null);
    assert(localStorageService != null);
    assert(localDisplayService != null);
    assert(mihinService != null);
    return hapiService(bundle, state);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result aidboxService(
        FhirClient client, Bundle bundle, Rx<RemoteState> state),
    Result hapiService(Bundle bundle, Rx<RemoteState> state),
    Result localStorageService(Bundle bundle, Rx<RemoteState> state),
    Result localDisplayService(Bundle bundle, Rx<RemoteState> state),
    Result mihinService(FhirClient client, Rx<RemoteState> state),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (hapiService != null) {
      return hapiService(bundle, state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result aidboxService(_Aidbox value),
    @required Result hapiService(_Hapi value),
    @required Result localStorageService(_LocalStorage value),
    @required Result localDisplayService(_LocalDisplay value),
    @required Result mihinService(_Mihin value),
  }) {
    assert(aidboxService != null);
    assert(hapiService != null);
    assert(localStorageService != null);
    assert(localDisplayService != null);
    assert(mihinService != null);
    return hapiService(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result aidboxService(_Aidbox value),
    Result hapiService(_Hapi value),
    Result localStorageService(_LocalStorage value),
    Result localDisplayService(_LocalDisplay value),
    Result mihinService(_Mihin value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (hapiService != null) {
      return hapiService(this);
    }
    return orElse();
  }
}

abstract class _Hapi extends ServiceCall {
  _Hapi._() : super._();
  factory _Hapi({Bundle bundle, Rx<RemoteState> state}) = _$_Hapi;

  Bundle get bundle;
  @override
  Rx<RemoteState> get state;
  @override
  _$HapiCopyWith<_Hapi> get copyWith;
}

/// @nodoc
abstract class _$LocalStorageCopyWith<$Res>
    implements $ServiceCallCopyWith<$Res> {
  factory _$LocalStorageCopyWith(
          _LocalStorage value, $Res Function(_LocalStorage) then) =
      __$LocalStorageCopyWithImpl<$Res>;
  @override
  $Res call({Bundle bundle, Rx<RemoteState> state});

  $BundleCopyWith<$Res> get bundle;
}

/// @nodoc
class __$LocalStorageCopyWithImpl<$Res> extends _$ServiceCallCopyWithImpl<$Res>
    implements _$LocalStorageCopyWith<$Res> {
  __$LocalStorageCopyWithImpl(
      _LocalStorage _value, $Res Function(_LocalStorage) _then)
      : super(_value, (v) => _then(v as _LocalStorage));

  @override
  _LocalStorage get _value => super._value as _LocalStorage;

  @override
  $Res call({
    Object bundle = freezed,
    Object state = freezed,
  }) {
    return _then(_LocalStorage(
      bundle: bundle == freezed ? _value.bundle : bundle as Bundle,
      state: state == freezed ? _value.state : state as Rx<RemoteState>,
    ));
  }

  @override
  $BundleCopyWith<$Res> get bundle {
    if (_value.bundle == null) {
      return null;
    }
    return $BundleCopyWith<$Res>(_value.bundle, (value) {
      return _then(_value.copyWith(bundle: value));
    });
  }
}

/// @nodoc
class _$_LocalStorage extends _LocalStorage {
  _$_LocalStorage({this.bundle, this.state}) : super._();

  @override
  final Bundle bundle;
  @override
  final Rx<RemoteState> state;

  @override
  String toString() {
    return 'ServiceCall.localStorageService(bundle: $bundle, state: $state)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LocalStorage &&
            (identical(other.bundle, bundle) ||
                const DeepCollectionEquality().equals(other.bundle, bundle)) &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(bundle) ^
      const DeepCollectionEquality().hash(state);

  @override
  _$LocalStorageCopyWith<_LocalStorage> get copyWith =>
      __$LocalStorageCopyWithImpl<_LocalStorage>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result aidboxService(
            FhirClient client, Bundle bundle, Rx<RemoteState> state),
    @required Result hapiService(Bundle bundle, Rx<RemoteState> state),
    @required Result localStorageService(Bundle bundle, Rx<RemoteState> state),
    @required Result localDisplayService(Bundle bundle, Rx<RemoteState> state),
    @required Result mihinService(FhirClient client, Rx<RemoteState> state),
  }) {
    assert(aidboxService != null);
    assert(hapiService != null);
    assert(localStorageService != null);
    assert(localDisplayService != null);
    assert(mihinService != null);
    return localStorageService(bundle, state);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result aidboxService(
        FhirClient client, Bundle bundle, Rx<RemoteState> state),
    Result hapiService(Bundle bundle, Rx<RemoteState> state),
    Result localStorageService(Bundle bundle, Rx<RemoteState> state),
    Result localDisplayService(Bundle bundle, Rx<RemoteState> state),
    Result mihinService(FhirClient client, Rx<RemoteState> state),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (localStorageService != null) {
      return localStorageService(bundle, state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result aidboxService(_Aidbox value),
    @required Result hapiService(_Hapi value),
    @required Result localStorageService(_LocalStorage value),
    @required Result localDisplayService(_LocalDisplay value),
    @required Result mihinService(_Mihin value),
  }) {
    assert(aidboxService != null);
    assert(hapiService != null);
    assert(localStorageService != null);
    assert(localDisplayService != null);
    assert(mihinService != null);
    return localStorageService(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result aidboxService(_Aidbox value),
    Result hapiService(_Hapi value),
    Result localStorageService(_LocalStorage value),
    Result localDisplayService(_LocalDisplay value),
    Result mihinService(_Mihin value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (localStorageService != null) {
      return localStorageService(this);
    }
    return orElse();
  }
}

abstract class _LocalStorage extends ServiceCall {
  _LocalStorage._() : super._();
  factory _LocalStorage({Bundle bundle, Rx<RemoteState> state}) =
      _$_LocalStorage;

  Bundle get bundle;
  @override
  Rx<RemoteState> get state;
  @override
  _$LocalStorageCopyWith<_LocalStorage> get copyWith;
}

/// @nodoc
abstract class _$LocalDisplayCopyWith<$Res>
    implements $ServiceCallCopyWith<$Res> {
  factory _$LocalDisplayCopyWith(
          _LocalDisplay value, $Res Function(_LocalDisplay) then) =
      __$LocalDisplayCopyWithImpl<$Res>;
  @override
  $Res call({Bundle bundle, Rx<RemoteState> state});

  $BundleCopyWith<$Res> get bundle;
}

/// @nodoc
class __$LocalDisplayCopyWithImpl<$Res> extends _$ServiceCallCopyWithImpl<$Res>
    implements _$LocalDisplayCopyWith<$Res> {
  __$LocalDisplayCopyWithImpl(
      _LocalDisplay _value, $Res Function(_LocalDisplay) _then)
      : super(_value, (v) => _then(v as _LocalDisplay));

  @override
  _LocalDisplay get _value => super._value as _LocalDisplay;

  @override
  $Res call({
    Object bundle = freezed,
    Object state = freezed,
  }) {
    return _then(_LocalDisplay(
      bundle: bundle == freezed ? _value.bundle : bundle as Bundle,
      state: state == freezed ? _value.state : state as Rx<RemoteState>,
    ));
  }

  @override
  $BundleCopyWith<$Res> get bundle {
    if (_value.bundle == null) {
      return null;
    }
    return $BundleCopyWith<$Res>(_value.bundle, (value) {
      return _then(_value.copyWith(bundle: value));
    });
  }
}

/// @nodoc
class _$_LocalDisplay extends _LocalDisplay {
  _$_LocalDisplay({this.bundle, this.state}) : super._();

  @override
  final Bundle bundle;
  @override
  final Rx<RemoteState> state;

  @override
  String toString() {
    return 'ServiceCall.localDisplayService(bundle: $bundle, state: $state)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LocalDisplay &&
            (identical(other.bundle, bundle) ||
                const DeepCollectionEquality().equals(other.bundle, bundle)) &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(bundle) ^
      const DeepCollectionEquality().hash(state);

  @override
  _$LocalDisplayCopyWith<_LocalDisplay> get copyWith =>
      __$LocalDisplayCopyWithImpl<_LocalDisplay>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result aidboxService(
            FhirClient client, Bundle bundle, Rx<RemoteState> state),
    @required Result hapiService(Bundle bundle, Rx<RemoteState> state),
    @required Result localStorageService(Bundle bundle, Rx<RemoteState> state),
    @required Result localDisplayService(Bundle bundle, Rx<RemoteState> state),
    @required Result mihinService(FhirClient client, Rx<RemoteState> state),
  }) {
    assert(aidboxService != null);
    assert(hapiService != null);
    assert(localStorageService != null);
    assert(localDisplayService != null);
    assert(mihinService != null);
    return localDisplayService(bundle, state);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result aidboxService(
        FhirClient client, Bundle bundle, Rx<RemoteState> state),
    Result hapiService(Bundle bundle, Rx<RemoteState> state),
    Result localStorageService(Bundle bundle, Rx<RemoteState> state),
    Result localDisplayService(Bundle bundle, Rx<RemoteState> state),
    Result mihinService(FhirClient client, Rx<RemoteState> state),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (localDisplayService != null) {
      return localDisplayService(bundle, state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result aidboxService(_Aidbox value),
    @required Result hapiService(_Hapi value),
    @required Result localStorageService(_LocalStorage value),
    @required Result localDisplayService(_LocalDisplay value),
    @required Result mihinService(_Mihin value),
  }) {
    assert(aidboxService != null);
    assert(hapiService != null);
    assert(localStorageService != null);
    assert(localDisplayService != null);
    assert(mihinService != null);
    return localDisplayService(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result aidboxService(_Aidbox value),
    Result hapiService(_Hapi value),
    Result localStorageService(_LocalStorage value),
    Result localDisplayService(_LocalDisplay value),
    Result mihinService(_Mihin value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (localDisplayService != null) {
      return localDisplayService(this);
    }
    return orElse();
  }
}

abstract class _LocalDisplay extends ServiceCall {
  _LocalDisplay._() : super._();
  factory _LocalDisplay({Bundle bundle, Rx<RemoteState> state}) =
      _$_LocalDisplay;

  Bundle get bundle;
  @override
  Rx<RemoteState> get state;
  @override
  _$LocalDisplayCopyWith<_LocalDisplay> get copyWith;
}

/// @nodoc
abstract class _$MihinCopyWith<$Res> implements $ServiceCallCopyWith<$Res> {
  factory _$MihinCopyWith(_Mihin value, $Res Function(_Mihin) then) =
      __$MihinCopyWithImpl<$Res>;
  @override
  $Res call({FhirClient client, Rx<RemoteState> state});
}

/// @nodoc
class __$MihinCopyWithImpl<$Res> extends _$ServiceCallCopyWithImpl<$Res>
    implements _$MihinCopyWith<$Res> {
  __$MihinCopyWithImpl(_Mihin _value, $Res Function(_Mihin) _then)
      : super(_value, (v) => _then(v as _Mihin));

  @override
  _Mihin get _value => super._value as _Mihin;

  @override
  $Res call({
    Object client = freezed,
    Object state = freezed,
  }) {
    return _then(_Mihin(
      client: client == freezed ? _value.client : client as FhirClient,
      state: state == freezed ? _value.state : state as Rx<RemoteState>,
    ));
  }
}

/// @nodoc
class _$_Mihin extends _Mihin {
  _$_Mihin({this.client, this.state}) : super._();

  @override
  final FhirClient client;
  @override
  final Rx<RemoteState> state;

  @override
  String toString() {
    return 'ServiceCall.mihinService(client: $client, state: $state)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Mihin &&
            (identical(other.client, client) ||
                const DeepCollectionEquality().equals(other.client, client)) &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(client) ^
      const DeepCollectionEquality().hash(state);

  @override
  _$MihinCopyWith<_Mihin> get copyWith =>
      __$MihinCopyWithImpl<_Mihin>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result aidboxService(
            FhirClient client, Bundle bundle, Rx<RemoteState> state),
    @required Result hapiService(Bundle bundle, Rx<RemoteState> state),
    @required Result localStorageService(Bundle bundle, Rx<RemoteState> state),
    @required Result localDisplayService(Bundle bundle, Rx<RemoteState> state),
    @required Result mihinService(FhirClient client, Rx<RemoteState> state),
  }) {
    assert(aidboxService != null);
    assert(hapiService != null);
    assert(localStorageService != null);
    assert(localDisplayService != null);
    assert(mihinService != null);
    return mihinService(client, state);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result aidboxService(
        FhirClient client, Bundle bundle, Rx<RemoteState> state),
    Result hapiService(Bundle bundle, Rx<RemoteState> state),
    Result localStorageService(Bundle bundle, Rx<RemoteState> state),
    Result localDisplayService(Bundle bundle, Rx<RemoteState> state),
    Result mihinService(FhirClient client, Rx<RemoteState> state),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (mihinService != null) {
      return mihinService(client, state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result aidboxService(_Aidbox value),
    @required Result hapiService(_Hapi value),
    @required Result localStorageService(_LocalStorage value),
    @required Result localDisplayService(_LocalDisplay value),
    @required Result mihinService(_Mihin value),
  }) {
    assert(aidboxService != null);
    assert(hapiService != null);
    assert(localStorageService != null);
    assert(localDisplayService != null);
    assert(mihinService != null);
    return mihinService(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result aidboxService(_Aidbox value),
    Result hapiService(_Hapi value),
    Result localStorageService(_LocalStorage value),
    Result localDisplayService(_LocalDisplay value),
    Result mihinService(_Mihin value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (mihinService != null) {
      return mihinService(this);
    }
    return orElse();
  }
}

abstract class _Mihin extends ServiceCall {
  _Mihin._() : super._();
  factory _Mihin({FhirClient client, Rx<RemoteState> state}) = _$_Mihin;

  FhirClient get client;
  @override
  Rx<RemoteState> get state;
  @override
  _$MihinCopyWith<_Mihin> get copyWith;
}
