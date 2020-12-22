import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/commands/commands.dart';
import 'package:prapare/localization.dart';
import 'package:prapare/routes/routes.dart';
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
            onPressed: () async => await SubmitQuestionnaireCommand().execute(),
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
