import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/commands/commands.dart';
import 'package:prapare/ui/localization.dart';

import 'styled_components.dart';

class StyledSubmitFab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);
    // using accent text theme so the buttons are light
    final TextTheme textTheme = context.theme.accentTextTheme;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FloatingActionButton.extended(
        label: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(labels.navigation.submit, style: textTheme.headline5),
        ),
        // todo: reimplement
        // onPressed: () async => await SubmitQuestionnaireCommand().execute(),
        onPressed: () async {
          await SaveResponsesCommand().execute();
          Get.bottomSheet(StyledSubmitBottomSheet());
        },
      ),
    );
  }
}
