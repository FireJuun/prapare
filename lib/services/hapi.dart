import 'package:dartz/dartz.dart';
import 'package:fhir/r4.dart';
import 'package:fhir_at_rest/requests/transaction_request.dart';

import 'db_service.dart';

Future<Either<dynamic, Unit>> hapi() async {
  final maybeBundle = await createBundle([
    'QuestionnaireResponse',
    'Condition',
    'Observation',
  ]);

  return maybeBundle.fold(
    (l) => left(l),
    (r) async {
      final request = TransactionRequest.r4(
        base: Uri.parse('http://hapi.fhir.org/baseR4'),
      );

      for (var e = 0; e < r.entry.length; e++) {
        if (r.entry[e].resource.resourceType == 'QuestionnaireResponse') {
          final QuestionnaireResponse response = r.entry[e].resource;
          r.entry[e].copyWith(
              resource: response.copyWith(
                  // todo: extract hardcoded patient value
                  subject: Reference(reference: 'Patient/1274896')));
        }
      }

      final response = await request
          // todo: extract hardcoded patient value
          .request(Resource.fromYaml(r.toYaml().replaceAll('4890', '1274896')));
      return response.fold(
        (l) => left(l),
        (r) => right(unit),
      );
    },
  );
}

Future<Either<DbFailure, Bundle>> createBundle(
    List<String> resourceTypes) async {
  var bundle = Bundle(
    type: BundleType.transaction,
    entry: [],
  );
  for (var type in resourceTypes) {
    final responses = await DbInterface().returnListOfSingleResourceType(type);

    responses.fold(
      (l) {
        return left(l);
      },
      (r) {
        bundle = addToBundle(r, bundle);
      },
    );
  }
  return right(bundle);
}

Bundle addToBundle(List<Resource> dbResources, Bundle bundle) {
  for (var resource in dbResources) {
    bundle.entry.add(BundleEntry(
        resource: resource,
        request: BundleRequest(
            method: BundleRequestMethod.post,
            url: FhirUri(resource.resourceType))));
  }

  return bundle;
}
