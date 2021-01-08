// ignore_for_file: missing_return
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fhir/r4.dart';
import 'package:get_storage/get_storage.dart';

import 'db_interface.dart';

Future<Either<DbFailure, Unit>> saveLocally() async {
  final maybeBundle = await createBundle([
    'QuestionnaireResponse',
    'Condition',
    'Observation',
  ]);
  return maybeBundle.fold(
    (l) => left(l),
    (r) async {
      try {
        final path = (await getExternalStorageDirectory()).path;
        final file = File('$path/bundle.txt');
        final saveBundle = r.toYaml();
        file.writeAsString(saveBundle);
      } catch (e) {
        return left(DbFailure(e));
      }
      return right(unit);
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
