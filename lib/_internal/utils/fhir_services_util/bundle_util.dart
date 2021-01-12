import 'package:dartz/dartz.dart';
import 'package:fhir/r4.dart';
import 'package:prapare/services/services.dart';

class BundleUtil {
  final List<String> _resourcesToUpload = [
    'QuestionnaireResponse',
    'Condition',
    'Observation',
  ];

  Future<Either<Error, List<BundleEntry>>> createBundle() async {
    final entries = <BundleEntry>[];
    for (var type in _resourcesToUpload) {
      final responses =
          await DbInterface().returnListOfSingleResourceType(type);

      responses.fold(
        (l) {
          return left(l);
        },
        (r) {
          for (var resource in r) {
            entries.add(BundleEntry(
                resource: resource,
                request: BundleRequest(
                    method: BundleRequestMethod.post,
                    url: FhirUri(resource.resourceType))));
          }
        },
      );
    }
    return right(entries);
  }
}
