import 'package:dartz/dartz.dart';
import 'package:fhir/r4.dart';
import 'package:fhir_at_rest/r4.dart';
import 'package:fhir_auth/r4/smart_client.dart';

import 'db_service.dart';

class MihinService {
  Future<Either<Error, Unit>> call(
    SmartClient client,
    String authUrl,
    String tokenUrl,
  ) async {
    client.authUrl = authUrl != null ? FhirUri(authUrl) : null;
    client.tokenUrl = tokenUrl != null ? FhirUri(tokenUrl) : null;
    await client.login();

    try {
      var response = await _upload('QuestionnaireResponse',
          R4ResourceType.QuestionnaireResponse, client);
      if (response.isLeft()) {
        return response;
      }
      response = await _upload('Condition', R4ResourceType.Condition, client);
      if (response.isLeft()) {
        return response;
      }
      response =
          await _upload('Observation', R4ResourceType.Observation, client);
      if (response.isLeft()) {
        return response;
      }
    } catch (e) {
      return left(e);
    }
    return right(unit);
  }
}

Future<Either<Error, Unit>> _upload(
    String title, R4ResourceType type, SmartClient client) async {
  final responses = await DbInterface().returnListOfSingleResourceType(title);
  return responses.fold(
    (l) => left(l),
    (r) async {
      for (var resource in r) {
        final upload = FhirRequest.create(
            base: Uri.parse('${client.baseUrl}'), resource: resource);
        try {
          final transactionReq = await upload.request(
            headers: await client.authHeaders,
          );
          print('MiHIN: ${transactionReq.toYaml()}');
        } catch (e) {
          return left(e);
        }
      }
      return right(unit);
    },
  );
}
