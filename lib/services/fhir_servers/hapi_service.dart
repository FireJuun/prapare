import 'package:dartz/dartz.dart';
import 'package:fhir/r4.dart';
import 'package:fhir_at_rest/r4.dart';

class HapiService {
  Future<Either<Error, Unit>> call(Bundle bundle) async {
    final newBundle =
        Bundle.fromYaml(bundle.toYaml().replaceAll('SarahThompson', '1274896'));

    final request = FhirRequest.transaction(
      base: Uri.parse('http://hapi.fhir.org/baseR4'),
      bundle: newBundle,
    );

    try {
      await request.request();
      return right(unit);
    } catch (e) {
      return left(e);
    }
  }
}
