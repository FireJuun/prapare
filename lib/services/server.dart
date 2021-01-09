import 'package:dartz/dartz.dart';
import 'package:fhir/r4.dart';
import 'package:fhir_auth/fhir_auth.dart';
import 'package:prapare/services/services.dart';

class Server {
  final List<String> resourcesToUpload = [
    'QuestionnaireResponse',
    'Condition',
    'Observation',
  ];

  final clinicalScopes = [
    ClinicalScope.r4(
      role: Role.patient,
      type: R4Types.patient,
      interaction: Interaction.any,
    ),
    ClinicalScope.r4(
      role: Role.patient,
      type: R4Types.questionnaire,
      interaction: Interaction.any,
    ),
    ClinicalScope.r4(
      role: Role.patient,
      type: R4Types.questionnaireresponse,
      interaction: Interaction.any,
    ),
    ClinicalScope.r4(
      role: Role.patient,
      type: R4Types.condition,
      interaction: Interaction.any,
    ),
    ClinicalScope.r4(
      role: Role.patient,
      type: R4Types.observation,
      interaction: Interaction.any,
    ),
    ClinicalScope.r4(
      role: Role.patient,
      type: R4Types.bundle,
      interaction: Interaction.any,
    ),
  ];

  Future<Either<DbFailure, List<BundleEntry>>> createBundle() async {
    final entries = <BundleEntry>[];
    for (var type in Server().resourcesToUpload) {
      final responses =
          await DbInterface().returnListOfSingleResourceType(type);

      responses.fold(
        (l) {
          return left(l);
        },
        (r) {
          for (var resource in r) {
            entries.add(BundleEntry(
                resource: resource,
                request: BundleRequest(
                    method: BundleRequestMethod.post,
                    url: FhirUri(resource.resourceType))));
          }
        },
      );
    }
    return right(entries);
  }

  FhirClient client(
    String baseUrl,
    String clientId,
    String redirectUrl,
    String secret,
  ) =>
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
