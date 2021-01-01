import 'package:dartz/dartz.dart';
import 'package:fhir/r4.dart';
import 'package:fhir_at_rest/requests/transaction_request.dart';

import 'db_interface.dart';

Future hapi() async {
  var bundle = Bundle(
    type: BundleType.transaction,
    entry: [],
  );

  final responses = await DbInterface()
      .returnListOfSingleResourceType('QuestionnaireResponse');

  bundle = addToBundle(responses, bundle);

  final conditions =
      await DbInterface().returnListOfSingleResourceType('Condition');

  bundle = addToBundle(conditions, bundle);

  final observations =
      await DbInterface().returnListOfSingleResourceType('Observation');

  bundle = addToBundle(observations, bundle);

  final request = TransactionRequest.r4(
    base: Uri.parse('http://hapi.fhir.org/baseR4'),
  );

  for (var e = 0; e < bundle.entry.length; e++) {
    if (bundle.entry[e].resource.resourceType == 'QuestionnaireResponse') {
      final QuestionnaireResponse response = bundle.entry[e].resource;
      bundle.entry[e].copyWith(
          resource: response.copyWith(
              subject: Reference(reference: 'Patient/1274896')));
    }
  }

  final response = await request.request(bundle);
  response.fold(
    (l) => print(l.errorMessage()),
    (r) => print('Successfully uploaded to Hapi'),
  );
}

Bundle addToBundle(
    Either<DbFailure, List<Resource>> dbResources, Bundle bundle) {
  dbResources.fold(
    (l) => print('Error: ${l.errorMessage}'),
    (r) {
      for (var res in r) {
        bundle.entry.add(BundleEntry(
            resource: res,
            request: BundleRequest(
                method: BundleRequestMethod.post,
                url: FhirUri(res.resourceType))));
      }
    },
  );
  return bundle;
}
