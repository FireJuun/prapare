import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fhir/r4.dart';
import 'package:fhir_at_rest/fhir_at_rest.dart' as rest;
import 'package:fhir_auth/fhir_auth.dart';

class AidboxService {
  Future<Either<SmartFailure, Unit>> call(
    Bundle bundle,
    FhirClient client,
    String authUrl,
    String tokenUrl,
  ) async {
    final attempt = await client.access(
      authUrl: authUrl,
      tokenUrl: tokenUrl,
    );
    return attempt.fold(
      (l) => left(l),
      (r) async {
        final transaction =
            rest.TransactionRequest.r4(base: Uri.parse('${client.baseUrl}'));
        try {
          final token = await client.accessToken();
          await transaction.request(
            bundle,
            headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
          );
          return right(unit);
        } catch (e) {
          return Left(SmartFailure.unknownFailure(failedValue: e));
        }
      },
    );
  }
}
