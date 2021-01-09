import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/commands/services_command.dart';
import 'package:prapare/ui/localization.dart';
import 'package:prapare/routes/routes.dart';
import 'package:prapare/services/display_service.dart';
import 'package:prapare/services/hapi.dart';
import 'package:prapare/services/mihin_service.dart';
import 'package:prapare/services/save_locally.dart';
import 'package:prapare/ui/styled_components/styled_components.dart';
import 'package:prapare/ui/views/settings/settings_dialog.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);
    final servicesController = Get.put(ServicesController());

    Widget _option(String text, Function function) => AlertDialog(
          title: Text(text),
          actions: [
            TextButton(
              child: Text(labels.prapare.answers.basic.no),
              onPressed: () => Get.back(),
            ),
            TextButton(
              child: Text(labels.prapare.answers.basic.yes),
              onPressed: () async {
                await function();
                Get.back();
              },
            ),
          ],
        );

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
                // todo: extract into SubmitQuestionnaireCommand
                await Get.dialog(servicesController.popup(
                    'Upload to public Hapi Server?', hapi));
                await Get.dialog(
                    servicesController.popup('Save locally?', saveLocally));
                await Get.dialog(servicesController.popup(
                    'Upload to Mihin?', MihinInterface.uploadAllToMihin));
                Get.dialog(Dialog(
                    child: SingleChildScrollView(
                        child: Text(await displayLocally()))));

                // todo: re-implement
                // await SubmitQuestionnaireCommand().execute();
              }),
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
