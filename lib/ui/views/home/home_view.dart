import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/localization.dart';
import 'package:prapare/routes/routes.dart';
import 'package:prapare/services/display_locally.dart';
import 'package:prapare/services/hapi.dart';
import 'package:prapare/services/mihin_interface.dart';
import 'package:prapare/services/save_locally.dart';
import 'package:prapare/ui/styled_components/styled_components.dart';
import 'package:prapare/ui/views/settings/settings_dialog.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);

    return Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    AppLogo(),
                    StyledButtonLarge(
                        title: labels.general.newSurvey,
                        onPressed: () => Get.toNamed(Routes.GROUP)),
                    StyledButtonLarge(title: labels.general.editSurvey
                        // onPressed: () => print(labels.general.birthDate),
                        ),
                    StyledButtonLarge(
                      title: labels.general.submitShare,
                      onPressed: () async {
                        // await hapi();
                        await saveLocally();
                        // await MihinInterface.uploadAllToMihin();
                        Get.dialog(Dialog(
                            child: SingleChildScrollView(
                                child: Text(await displayLocally()))));
                      },
                    ),
                    Align(
                        alignment: const FractionalOffset(0.8, 0),
                        child: IconButton(
                            icon: const Icon(Icons.settings, size: 36),
                            onPressed: () => settingsDialog(context)))
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
