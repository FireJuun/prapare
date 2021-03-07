import 'dart:io';
import 'dart:isolate';

import 'package:dartz/dartz.dart';
import 'package:fhir/r4.dart';
import 'package:fhir_at_rest/fhir_at_rest.dart' as rest;
import 'package:fhir_auth/fhir_auth.dart';

class AidboxService {
  Future<Either<Error, Unit>> call(
    Bundle bundle,
    SmartClient client,
    String authUrl,
    String tokenUrl,
  ) async {
    final attempt = await client.access(
      authUrl: authUrl,
      tokenUrl: tokenUrl,
    );
    return attempt.fold(
      (l) => left(
        RemoteError(
          l.errorMessage(),
          StackTrace.current.toString(),
        ),
      ),
      (r) async {
        final transaction =
            rest.TransactionRequest.r4(base: Uri.parse('${client.baseUrl}'));
        try {
          final token = await client.accessToken();
          final response = await transaction.request(
            bundle,
            headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
          );
          return response.fold(
            (l) => left(
              RemoteError(
                l.errorMessage(),
                StackTrace.current.toString(),
              ),
            ),
            (r) => null,
          );
        } catch (e) {
          return Left(e);
        }
      },
    );
  }
}
