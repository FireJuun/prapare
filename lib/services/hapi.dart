import 'package:fhir/r4.dart';
import 'package:fhir_at_rest/requests/transaction_request.dart';

Future hapi(Bundle bundle) async {
  print(bundle.toJson());
  final request = TransactionRequest.r4(
    base: Uri.parse('http://hapi.fhir.org/baseR4'),
  );
  final response = await request.request(bundle);
  response.fold((l) => print(l.errorMessage()), (r) => print(r.toJson()));
}
