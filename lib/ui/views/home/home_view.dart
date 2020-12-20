import 'dart:convert';

import 'package:fhir/r4.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/localization.dart';
import 'package:prapare/routes/routes.dart';
import 'package:prapare/services/services.dart';
import 'package:prapare/ui/styled_components/styled_components.dart';
import 'package:prapare/ui/views/settings/settings_dialog.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: StyledScrollOnOverflow(
        children: [
          AppLogo(),
          StyledButtonLarge(
              title: labels.general.newSurvey,
              onPressed: () => Get.toNamed(Routes.GROUP)),
          StyledButtonLarge(
            title: labels.general.editSurvey,
            onPressed: () => Get.toNamed(Routes.INFO),
            // onPressed: () => print(labels.general.birthDate),
          ),
          StyledButtonLarge(
            title: labels.general.submitShare,
            onPressed: () async {
              final responses = await DbInterface()
                  .returnListOfSingleResourceType('QuestionnaireResponse');
              responses.fold(
                (l) => Get.snackbar('Error', l.errorMessage),
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
                  const encoder = JsonEncoder.withIndent('  ');
                  final localBundle = encoder.convert(bundle.toJson());
                  await LocalStorage().saveBundle(localBundle);
                  await HapiStorage().saveBundle(bundle);
                  Get.dialog(Dialog(
                      child: SingleChildScrollView(child: Text(localBundle))));
                },
              );
            },
          ),
          Align(
            alignment: const FractionalOffset(0.8, 0),
            child: IconButton(
              icon: const Icon(Icons.settings, size: 36),
              onPressed: () => settingsDialog(context),
            ),
          ),
        ],
      ),
    );
  }
}
