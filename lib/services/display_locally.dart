import 'dart:convert';

import 'package:fhir/r4.dart';

import 'db_interface.dart';

Future<String> displayLocally() async {
  final responses = await DbInterface()
      .returnListOfSingleResourceType('QuestionnaireResponse');

  return responses.fold(
    (l) => l.errorMessage,
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
      const encoder = JsonEncoder.withIndent('  ');
      return encoder.convert(bundle.toYaml());
    },
  );
}
