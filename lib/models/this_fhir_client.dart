import 'package:fhir/r4.dart';
import 'package:fhir_auth/fhir_auth.dart';

class ThisSmartClient {
  SmartClient client(
    String baseUrl,
    String clientId,
    String redirectUrl,
    String secret,
  ) =>
      SmartClient(
        baseUrl: FhirUri(baseUrl),
        clientId: clientId,
        redirectUri: FhirUri(redirectUrl),
        scopes: Scopes(
          clinicalScopes: [
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
          ],
          encounterLaunch: true,
          patientLaunch: true,
          openid: true,
          offlineAccess: true,
        ),
        secret: secret,
      );
}
