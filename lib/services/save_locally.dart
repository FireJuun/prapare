import 'dart:convert';
import 'dart:io';

import 'package:fhir/r4.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'db_interface.dart';

Future saveLocally() async {
  final responses = await DbInterface()
      .returnListOfSingleResourceType('QuestionnaireResponse');

  responses.fold(
    (l) => Get.snackbar('Error', l.errorMessage),
    (r) async {
      final bundle = Bundle(
        type: BundleType.transaction,
        entry: [],
      );
      for (var response in r) {
        bundle.entry.add(BundleEntry(
            resource: response,
            request: BundleRequest(
                method: BundleRequestMethod.post,
                url: FhirUri('QuestionnaireResponse'))));
      }
      final path = (await getExternalStorageDirectory()).path;
      final file = File('$path/questionnaireBundle.txt');
      const encoder = JsonEncoder.withIndent('  ');
      final saveBundle = encoder.convert(bundle.toYaml());
      file.writeAsString(saveBundle);
    },
  );
}
