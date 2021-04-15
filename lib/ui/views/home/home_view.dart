import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/commands/commands.dart';
import 'package:prapare/ui/localization.dart';
import 'package:prapare/routes/routes.dart';
import 'package:prapare/ui/styled_components/styled_components.dart';
import 'package:prapare/ui/views/home/home_settings_button.dart';

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
            onPressed: () => NewSurveyCommand().execute(),
          ),
          StyledButtonLarge(
            title: labels.general.editSurvey,
            onPressed: () => Get.toNamed(Routes.INFO),
          ),
          StyledButtonLarge(
            title: labels.general.submitShare,
            onPressed: () => Get.bottomSheet(StyledSubmitBottomSheet()),
          ),
          HomeSettingsButton(),
        ],
      ),
    );
  }
}
