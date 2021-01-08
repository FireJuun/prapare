import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fhir/r4.dart';
import 'package:fhir_at_rest/fhir_at_rest.dart' as rest;
import 'package:fhir_auth/fhir_auth.dart';

import 'credentials.dart';
import 'db_interface.dart';

class MihinInterface {
  MihinInterface();

  static Future<Either<dynamic, Unit>> uploadAllToMihin() async {
    /// create the smart on fhir client, must include baseUrl, clientId,
    /// redirectUrl (which we have set ahead of time in the Android
    /// build.gradle and iOS Info.plist files), includes the scopes we are
    /// interested in, launch types, if we need to use openid or have
    /// offline access. Most of this is detailed here:
    /// https://github.com/fhir-fli/fhir_at_rest
    final client = FhirClient(
      baseUrl: FhirUri(mihinUrl),
      clientId: mihinClientId,
      redirectUri: FhirUri(prapareRedirectUrl),
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
        openid: true,
        offlineAccess: true,
      ),
      secret: mihinClientSecret,
    );

    final attempt = await client.access(
      authUrl: mihinAuthUrl,
      tokenUrl: mihinTokenUrl,
    );

    return attempt.fold(
      (l) => left(l),
      (r) async {
        var response = await upload('QuestionnaireResponse',
            rest.R4Types.questionnaireresponse, client);
        if (response.isLeft()) {
          return left(response.getOrElse(null));
        }
        response = await upload('Condition', rest.R4Types.condition, client);
        if (response.isLeft()) {
          return left(response.getOrElse(null));
        }
        response =
            await upload('Observation', rest.R4Types.observation, client);
        return response.fold((l) => left(l), (r) => right(unit));
      },
    );
  }

  static Future<Either<dynamic, Unit>> upload(
      String title, rest.R4Types type, FhirClient client) async {
    final responses = await DbInterface().returnListOfSingleResourceType(title);

    return responses.fold(
      (l) => left(l),
      (r) async {
        for (var resource in r) {
          final upload =
              rest.CreateRequest.r4(base: Uri.parse(mihinUrl), type: type);
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
            return left(rest.RestfulFailure.unknownFailure(failedValue: e));
          }
        }
        return right(unit);
      },
    );
  }
}
