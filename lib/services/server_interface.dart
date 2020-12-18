import 'dart:io';

import 'package:fhir/r4.dart';
import 'package:fhir_at_rest/fhir_at_rest.dart' as rest;
import 'package:get/get.dart';
import 'package:smart_on_fhir/smart_on_fhir.dart';

import 'db_interface.dart';

class ServerInterface {
  ServerInterface();

  Future uploadAllToAidbox() async {
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
        final smart = Smart(
          baseUrl: FhirUri('https://prapare.aidbox.app/fhir'),
          clientId: 'prapare',
          redirectUri: FhirUri('com.fhirfli.prapare://'),
          scopes: Scopes(
            clinicalScopes: [
              ClinicalScope.r4(
                role: Role.user,
                type: R4Types.patient,
                interaction: Interaction.any,
              ),
              ClinicalScope.r4(
                role: Role.user,
                type: R4Types.questionnaire,
                interaction: Interaction.any,
              ),
              ClinicalScope.r4(
                role: Role.user,
                type: R4Types.questionnaireresponse,
                interaction: Interaction.any,
              ),
            ],
            encounterLaunch: true,
            patientLaunch: true,
            openid: true,
            offlineAccess: true,
          ),
          fhirServer: FhirUri('https://prapare.aidbox.app/fhir'),
        );
        final auth = await smart.client(secret: 'verysecret');
        auth.fold(
          (left) => print(left.errorMessage()),
          (right) async {
            final uploadBundle =
                Bundle(type: BundleType.transaction, entry: []);
            for (var resource in r) {
              print(resource.toJson());
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

            try {
              final transaction = rest.TransactionRequest.r4(
                  base: Uri.parse('https://prapare.aidbox.app/fhir'));
              final transactionReq = await transaction.request(
                uploadBundle,
                headers: {
                  HttpHeaders.authorizationHeader: 'Bearer ${right.accessToken}'
                },
              );
              print(transactionReq.toString());
              print(
                transactionReq.fold(
                  (lefting) => lefting.errorMessage(),
                  (righting) => righting.toJson(),
                ),
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
