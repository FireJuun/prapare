import 'package:fhir/r4.dart';
import 'package:get/get.dart';
import 'package:prapare/services/services.dart';

import '../abstract_command.dart';

class SubmitQuestionnaireCommand extends AbstractCommand {
  @override
  Future<void> execute() async {
    final responses = await DbInterface()
        .returnListOfSingleResourceType('QuestionnaireResponse');
    responses.fold(
      (l) => Get.snackbar('Error', l.toString()),
      (r) async {
        final bundle = Bundle(
          type: BundleType.transaction,
          entry: [],
        );
        for (var response in r) {
          bundle.entry.add(BundleEntry(
              resource: response,
              request: BundleRequest(
                  method: BundleRequestMethod.post,
                  url: FhirUri('QuestionnaireResponse'))));
        }

        // todo - enable to show JSON data as a dialog
        // const encoder = JsonEncoder.withIndent('  ');
        // final localBundle = encoder.convert(bundle.toJson());
        // Get.dialog(
        //     Dialog(child: SingleChildScrollView(child: Text(localBundle))));
      },
    );
  }
}
