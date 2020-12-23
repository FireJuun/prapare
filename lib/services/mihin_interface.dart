import 'dart:io';

import 'package:fhir/r4.dart';
import 'package:fhir_at_rest/fhir_at_rest.dart' as rest;
import 'package:fhir_auth/fhir_auth.dart';
import 'package:get/get.dart';

import 'credentials.dart';
import 'db_interface.dart';

class MihinInterface {
  MihinInterface();

  static Future uploadAllToMihin() async {
    /// retrieve a list of all resources that are stored locally
    final allResources = await DbInterface().allResources();
    allResources.fold(
      ///if there is an error, print it out here
      (l) => print(l.errorMessage),
      (r) async {
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
                role: Role.user,
                type: R4Types.patient,
                interaction: Interaction.any,
              ),
              ClinicalScope.r4(
                role: Role.patient,
                type: R4Types.questionnaire,
                interaction: Interaction.any,
              ),
              ClinicalScope.r4(
                role: Role.user,
                type: R4Types.questionnaire,
                interaction: Interaction.any,
              ),
              ClinicalScope.r4(
                role: Role.patient,
                type: R4Types.questionnaireresponse,
                interaction: Interaction.any,
              ),
              ClinicalScope.r4(
                role: Role.user,
                type: R4Types.questionnaireresponse,
                interaction: Interaction.any,
              ),
              ClinicalScope.r4(
                role: Role.patient,
                type: R4Types.condition,
                interaction: Interaction.any,
              ),
              ClinicalScope.r4(
                role: Role.user,
                type: R4Types.condition,
                interaction: Interaction.any,
              ),
              ClinicalScope.r4(
                role: Role.patient,
                type: R4Types.observation,
                interaction: Interaction.any,
              ),
              ClinicalScope.r4(
                role: Role.user,
                type: R4Types.observation,
                interaction: Interaction.any,
              ),
            ],
            encounterLaunch: true,
            patientLaunch: true,
            openid: true,
            offlineAccess: true,
          ),
          secret: mihinClientSecret,
        );

        final attempt = await client.access(
          authUrl: mihinAuthUrl,
          tokenUrl: mihinTokenUrl,
        );

        attempt.fold(
          (left) => print(left.errorMessage()),
          (right) async {
            final token = await client.accessToken();
            final uploadBundle =
                Bundle(type: BundleType.transaction, entry: []);
            for (var resource in r) {
              uploadBundle.entry.add(
                BundleEntry(
                  resource: resource,
                  request: BundleRequest(
                    method: BundleRequestMethod.put,
                    url: FhirUri(resource.resourceType),
                  ),
                ),
              );
            }
            final transaction = rest.TransactionRequest.r4(
                base: Uri.parse(mihinUrl));

            try {
              final transactionReq = await transaction.request(
                uploadBundle,
                headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
              );
            } catch (e) {
              Get.snackbar('Server Error', e.toString());
            }
          },
        );
      },
    );
  }
}
