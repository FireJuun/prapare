import 'package:fhir/r4.dart';
import 'package:fhir_at_rest/requests/transaction_request.dart';
import 'package:get/get.dart';

import 'db_interface.dart';

Future hapi() async {
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
      final request = TransactionRequest.r4(
        base: Uri.parse('http://hapi.fhir.org/baseR4'),
      );
      QuestionnaireResponse quest = bundle.entry[0].resource;
      quest = quest.copyWith(subject: Reference(reference: 'Patient/1274896'));
      final newBundle =
          bundle.copyWith(entry: [bundle.entry[0].copyWith(resource: quest)]);
      final response = await request.request(newBundle);
      response.fold((l) => print(l.errorMessage()), (r) => print(r.toJson()));
    },
  );
}
