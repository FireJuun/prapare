import 'dart:io';
import 'dart:isolate';

import 'package:dartz/dartz.dart';
import 'package:fhir_at_rest/fhir_at_rest.dart' as rest;
import 'package:fhir_auth/fhir_auth.dart';

import 'db_service.dart';

class MihinService {
  Future<Either<Error, Unit>> call(
    FhirClient client,
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
        var response = await _upload('QuestionnaireResponse',
            rest.R4Types.questionnaireresponse, client);

        return response.fold(
          (l) => left(l),
          (r) async {
            response =
                await _upload('Condition', rest.R4Types.condition, client);
            return response.fold(
              (l) => left(l),
              (r) async {
                response = await _upload(
                    'Observation', rest.R4Types.observation, client);
                return response.fold((l) => left(l), (r) => right(unit));
              },
            );
          },
        );
      },
    );
  }

  Future<Either<Error, Unit>> _upload(
      String title, rest.R4Types type, FhirClient client) async {
    final responses = await DbInterface().returnListOfSingleResourceType(title);

    return responses.fold(
      (l) => left(l),
      (r) async {
        for (var resource in r) {
          final upload = rest.CreateRequest.r4(
              base: Uri.parse('${client.baseUrl}'), type: type);
          try {
            final transactionReq = await upload.request(
              resource: resource,
              headers: {
                HttpHeaders.authorizationHeader:
                    'Bearer ${await client.accessToken()}'
              },
            );
            if (transactionReq.isLeft()) {
              return left(transactionReq.getOrElse(null));
            }
          } catch (e) {
            return left(e);
          }
        }
        return right(unit);
      },
    );
  }
}
