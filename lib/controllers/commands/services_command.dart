import 'package:dartz/dartz.dart';
import 'package:fhir/r4.dart';
import 'package:fhir_auth/fhir_auth.dart';
import 'package:get/get.dart';
import 'package:prapare/models/server.dart';
import 'package:prapare/services/services.dart';
import 'package:prapare/ui/localization.dart';
import 'package:remote_state/remote_state.dart';

class ServicesController extends GetxController {
  static ServicesController get to => Get.find();

  /// PROPERTIES
  final labels = AppLocalizations.of(Get.context);
  final _state = RemoteState.initial().obs;

  /// GETTERS
  RemoteState get state => _state.value;

  /// EVENTS
  Future aidbox() async {
    _state.value = RemoteState.initial();
    final bundle = _createBundle();
  }

  Future display() async {
    _state.value = RemoteState.initial();
    final bundle = _createBundle();
  }

  Future hapi() async {
    _state.value = RemoteState.initial();
    final bundle = _createBundle();
  }

  Future localStorage() async {
    _state.value = RemoteState.initial();
    final bundle = _createBundle();
  }

  Future<Either<DbFailure, Bundle>> _createBundle() async {
    var bundle = Bundle(type: BundleType.transaction, entry: []);
    for (var type in Server().resourcesToUpload) {
      final responses =
          await DbInterface().returnListOfSingleResourceType(type);

      responses.fold(
        (l) {
          return left(l);
        },
        (r) {
          bundle = _addToBundle(r, bundle);
        },
      );
    }
    return right(bundle);
  }

  Bundle _addToBundle(List<Resource> dbResources, Bundle bundle) {
    for (var resource in dbResources) {
      bundle.entry.add(BundleEntry(
          resource: resource,
          request: BundleRequest(
              method: BundleRequestMethod.post,
              url: FhirUri(resource.resourceType))));
    }
    return bundle;
  }

  FhirClient _client({
    String baseUrl,
    String clientId,
    String redirectUrl,
    String secret,
  }) =>
      FhirClient(
        baseUrl: FhirUri(baseUrl),
        clientId: clientId,
        redirectUri: FhirUri(redirectUrl),
        scopes: Scopes(
          clinicalScopes: Server().clinicalScopes,
          encounterLaunch: true,
          patientLaunch: true,
          openid: true,
          offlineAccess: true,
        ),
        secret: secret,
      );
}
