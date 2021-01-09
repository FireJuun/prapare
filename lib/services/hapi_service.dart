import 'package:dartz/dartz.dart';
import 'package:fhir/r4.dart';
import 'package:fhir_at_rest/fhir_at_rest.dart' as rest;
import 'package:fhir_auth/fhir_auth.dart';

class HapiService {
  Future<Either<SmartFailure, Unit>> call(Bundle bundle) async {
    final request = rest.TransactionRequest.r4(
      base: Uri.parse('http://hapi.fhir.org/baseR4'),
    );

    bundle = Bundle.fromYaml(bundle.toYaml().replaceAll('4890', '1274896'));
    final response = await request.request(bundle);

    return response.fold(
      (l) => left(SmartFailure.unknownFailure(failedValue: l)),
      (r) {
        print(r.toJson());
        return right(unit);
      },
    );
  }
}
