import 'package:dartz/dartz.dart';
import 'package:fhir/r4.dart';
import 'package:fhir_at_rest/r4.dart';
import 'package:fhir_auth/r4/smart_client.dart';

class AidboxService {
  Future<Either<Error, Unit>> call(
    Bundle bundle,
    SmartClient client,
    String authUrl,
    String tokenUrl,
  ) async {
    client.authUrl = authUrl != null ? FhirUri(authUrl) : null;
    client.tokenUrl = tokenUrl != null ? FhirUri(tokenUrl) : null;
    await client.login();

    try {
      final transaction = FhirRequest.transaction(
        base: Uri.parse('${client.baseUrl}'),
        bundle: bundle,
      );
      await transaction.request(headers: await client.authHeaders);
      return right(unit);
    } catch (e) {
      return left(e);
    }
  }
}
