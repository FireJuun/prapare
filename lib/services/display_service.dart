import 'package:dartz/dartz.dart';
import 'package:fhir/r4.dart';

import 'db_service.dart';

Future<String> displayLocally() async {
  final responses = await DbInterface()
      .returnListOfSingleResourceType('QuestionnaireResponse');

  final conditions =
      await DbInterface().returnListOfSingleResourceType('Condition');

  final observations =
      await DbInterface().returnListOfSingleResourceType('Observation');

  var bundle = Bundle(
    type: BundleType.transaction,
    entry: [],
  );

  bundle = addToBundle(responses, bundle);
  bundle = addToBundle(conditions, bundle);
  bundle = addToBundle(observations, bundle);
  return bundle.toYaml();
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
