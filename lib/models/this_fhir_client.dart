import 'package:fhir/r4.dart';
import 'package:fhir_auth/r4.dart';
import 'package:fhir_auth/r4/smart_client.dart';

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
          clinicalScopes: const [
            Tuple3(
              Role.patient,
              R4ResourceType.Patient,
              Interaction.any,
            ),
            Tuple3(
              Role.patient,
              R4ResourceType.Questionnaire,
              Interaction.any,
            ),
            Tuple3(
              Role.patient,
              R4ResourceType.QuestionnaireResponse,
              Interaction.any,
            ),
            Tuple3(
              Role.patient,
              R4ResourceType.Condition,
              Interaction.any,
            ),
            Tuple3(
              Role.patient,
              R4ResourceType.Observation,
              Interaction.any,
            ),
            Tuple3(
              Role.patient,
              R4ResourceType.Bundle,
              Interaction.any,
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
