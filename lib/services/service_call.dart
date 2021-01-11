import 'package:fhir/r4.dart';
import 'package:fhir_auth/fhir_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:prapare/_internal/utils/bundle_util.dart';
import 'package:prapare/api/api.dart';
import 'package:prapare/models/this_fhir_client.dart';
import 'package:prapare/services/services.dart';
import 'package:remote_state/remote_state.dart';

part 'service_call.freezed.dart';

@freezed
abstract class ServiceCall implements _$ServiceCall {
  ServiceCall._();

  factory ServiceCall.aidboxService({
    FhirClient client,
    Bundle bundle,
    Rx<RemoteState> state,
  }) = _Aidbox;

  factory ServiceCall.hapiService({
    Bundle bundle,
    Rx<RemoteState> state,
  }) = _Hapi;

  factory ServiceCall.localStorageService({
    Bundle bundle,
    Rx<RemoteState> state,
  }) = _LocalStorage;

  factory ServiceCall.localDisplayService({
    Bundle bundle,
    Rx<RemoteState> state,
  }) = _LocalDisplay;

  factory ServiceCall.mihinService({
    FhirClient client,
    Rx<RemoteState> state,
  }) = _Mihin;

  factory ServiceCall.aidbox() => ServiceCall.aidboxService(
        client: ThisFhirClient().client(
          ApiPrivate.aidboxUrl,
          ApiPrivate.aidboxClientId,
          ApiPrivate.prapareRedirectUrl,
          ApiPrivate.aidboxClientSecret,
        ),
        bundle: Bundle(type: BundleType.transaction, entry: []),
        state: RemoteState.initial().obs,
      );

  factory ServiceCall.hapi() => ServiceCall.hapiService(
        bundle: Bundle(type: BundleType.transaction, entry: []),
        state: RemoteState.initial().obs,
      );

  factory ServiceCall.localSave() => ServiceCall.localStorageService(
        bundle: Bundle(type: BundleType.transaction, entry: []),
        state: RemoteState.initial().obs,
      );

  factory ServiceCall.localDisplay() => ServiceCall.localDisplayService(
        bundle: Bundle(type: BundleType.transaction, entry: []),
        state: RemoteState.initial().obs,
      );

  factory ServiceCall.mihin() => ServiceCall.mihinService(
        client: ThisFhirClient().client(
          ApiPrivate.mihinUrl,
          ApiPrivate.mihinClientId,
          ApiPrivate.prapareRedirectUrl,
          ApiPrivate.mihinClientSecret,
        ),
        state: RemoteState.initial().obs,
      );

  Future call() async {
    state.value = RemoteState.loading();
    final entries = await BundleUtil().createBundle();
    entries.fold(
      (left) => state.value = RemoteState.error(left.toString()),
      (right) {
        map(
          aidboxService: (c) async {
            c.bundle.entry.addAll(right);
            final result = await AidboxService().call(
              c.bundle,
              c.client,
              ApiPrivate.aidboxAuthUrl,
              ApiPrivate.aidboxTokenUrl,
            );
            state.value = result.fold(
              (l) => RemoteState.error(l.toString()),
              (r) => RemoteState.success('Successful upload to Aidbox'),
            );
          },
          hapiService: (c) async {
            c.bundle.entry.addAll(right);
            final result = await HapiService().call(c.bundle);
            state.value = result.fold(
              (l) => RemoteState.error(l.errorMessage()),
              (r) => RemoteState.success(
                  'Successful upload to Public Hapi Server'),
            );
          },
          localStorageService: (c) async {
            c.bundle.entry.addAll(right);
            final result = await LocalStorageService().call(c.bundle.toYaml());
            state.value = result.fold(
              (l) => RemoteState.error('Error: $l'),
              (r) => RemoteState.success('Successfully saved to local device'),
            );
          },
          localDisplayService: (c) {
            c.bundle.entry.addAll(right);
            state.value = RemoteState.success(c.bundle.toYaml());
          },
          mihinService: (c) async {
            final result = await MihinService().call(
              c.client,
              ApiPrivate.aidboxAuthUrl,
              ApiPrivate.aidboxTokenUrl,
            );
            state.value = result.fold(
              (l) => RemoteState.error(l),
              (r) => RemoteState.success('Successful upload to Mihin'),
            );
          },
        );
      },
    );
  }
}
