import 'package:fhir/r4.dart';
import 'package:fhir_at_rest/fhir_at_rest.dart' as rest;

class HapiStorage {
  Future saveBundle(Bundle bundle) async {
    final request = rest.TransactionRequest.r4(
      base: Uri.parse('http://hapi.fhir.org/baseR4'),
    );
    final response = await request.request(bundle);
    response.fold((l) => print(l.errorMessage()), (r) => print(r.toJson()));
  }
}
