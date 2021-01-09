import 'package:fhir/r4.dart';
import 'package:fhir_auth/fhir_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:prapare/api/api.dart';
import 'package:prapare/services/server.dart';
import 'package:prapare/services/services.dart';
import 'package:remote_state/remote_state.dart';

part 'service.freezed.dart';

@freezed
abstract class Service implements _$Service {
  Service._();

  factory Service.aidboxService({
    FhirClient client,
    Bundle bundle,
    Rx<RemoteState> state,
  }) = _Aidbox;

  factory Service.hapiService({
    Bundle bundle,
    Rx<RemoteState> state,
  }) = _Hapi;

  factory Service.localStorageService({
    Bundle bundle,
    Rx<RemoteState> state,
  }) = _Local;

  factory Service.mihinService({
    FhirClient client,
    Rx<RemoteState> state,
  }) = _Mihin;

  factory Service.aidbox() => Service.aidboxService(
        client: Server().client(
          ApiPrivate.aidboxUrl,
          ApiPrivate.aidboxClientId,
          ApiPrivate.prapareRedirectUrl,
          ApiPrivate.aidboxClientSecret,
        ),
        bundle: Bundle(type: BundleType.transaction, entry: []),
        state: RemoteState.initial().obs,
      );

  factory Service.hapi() => Service.hapiService(
        bundle: Bundle(type: BundleType.transaction, entry: []),
        state: RemoteState.initial().obs,
      );

  factory Service.local() => Service.localStorageService(
        bundle: Bundle(type: BundleType.transaction, entry: []),
        state: RemoteState.initial().obs,
      );

  factory Service.mihin() => Service.mihinService(
        client: Server().client(
          ApiPrivate.mihinUrl,
          ApiPrivate.mihinClientId,
          ApiPrivate.prapareRedirectUrl,
          ApiPrivate.mihinClientSecret,
        ),
        state: RemoteState.initial().obs,
      );

  Future call() async {
    state.value = RemoteState.loading();
    final entries = await Server().createBundle();
    entries.fold(
      (left) => state.value = RemoteState.error(left.errorMessage()),
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
              (l) => RemoteState.error(l.errorMessage()),
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
          mihinService: (c) async {
            final result = await MihinService().call(
              c.client,
              ApiPrivate.aidboxAuthUrl,
              ApiPrivate.aidboxTokenUrl,
            );
            state.value = result.fold(
              (l) => RemoteState.error(l.errorMessage()),
              (r) => RemoteState.success('Successful upload to Mihin'),
            );
          },
        );
      },
    );
  }
}
