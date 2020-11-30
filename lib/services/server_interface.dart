import 'package:fhir/r4.dart';
import 'package:smart_on_fhir/smart.dart';

import 'db_interface.dart';

class ServerInterface {
  ServerInterface();

  Future uploadAll() async {
    final allResources = await DbInterface().allResources();
    allResources.fold(
      (l) => print(l.errorMessage),
      (r) {
        var uploadBundle = Bundle(type: BundleType.transaction, entry: []);
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
        var smartClient = Smart(
            baseUrl: FhirUri('https://prapare.aidbox.app/fhir'),
            clientId: 'prapare',
            redirectUri: FhirUri('prapare'));
      },
    );
  }
}
