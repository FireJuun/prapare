import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/localization.dart';
import 'package:prapare/routes/routes.dart';
import 'package:prapare/ui/styled_components/styled_components.dart';
import 'package:prapare/ui/views/settings/settings_dialog.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 48.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppLogo(),
              StyledButtonLarge(
                  title: labels.general.newSurvey,
                  onPressed: () => Get.toNamed(Routes.SURVEY)),
              StyledButtonLarge(title: labels.general.editSurvey
                  // onPressed: () => print(labels.general.birthDate),
                  ),
              StyledButtonLarge(title: labels.general.submitShare),
              Align(
                  alignment: FractionalOffset(0.8, 0),
                  child: IconButton(
                      icon: Icon(Icons.settings, size: 36),
                      onPressed: () => settingsDialog()))
            ],
          ),
        ),
      ),
    );
  }
}