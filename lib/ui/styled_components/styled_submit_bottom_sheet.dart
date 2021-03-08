import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/commands/commands.dart';
import 'package:prapare/services/services.dart';
import 'package:prapare/ui/icons.dart';
import 'package:prapare/ui/localization.dart';

class StyledSubmitBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);

    /// *************************************************
    /// ************ LOCALLY REUSED WIDGETS ************
    /// *************************************************

    Widget _option(String text, String title, ServiceCall service,
            {int seconds}) =>
        AlertDialog(
          content: Obx(
            () => SingleChildScrollView(
              child: Text(
                service.state.value.map(
                  initial: (m) => text,
                  loading: (m) => '$title is in process',
                  success: (m) => m.value,
                  error: (m) => 'Error: ${m.error}',
                ),
              ),
            ),
          ),
          actions: [
            TextButton(
              child: Text(labels.prapare.answers.basic.no),
              onPressed: () => Get.back(),
            ),
            TextButton(
              child: Text(labels.prapare.answers.basic.yes),
              onPressed: () async {
                await SubmitQuestionnaireCommand().execute();
                await service.call();
                await Future.delayed(Duration(seconds: seconds ?? 0));
                // Get.back();
              },
            ),
          ],
        );

    Widget _listItem(
            {@required Widget image,
            @required Widget title,
            @required Function onTap}) =>
        SizedBox(
            width: 180,
            child: ListTile(leading: image, title: title, onTap: onTap));

    Widget _listIcon(IconData iconData) => Icon(
          iconData,
          size: 56.0,
          color: context.theme.accentColor,
        );

    Widget _listIconFromAsset(String assetPath) =>
        Image.asset(assetPath, width: 64.0);

    /// *************************************************
    /// ************** RETURN FUNCTION ***************
    /// *************************************************

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Wrap(
            alignment: WrapAlignment.center,
            runSpacing: 12.0,
            children: <Widget>[
              _listItem(
                  image: _listIcon(Icons.save),
                  title: const Text('Local: Save'),
                  onTap: () async {
                    await Get.dialog(_option(
                      'Save locally?',
                      'Saving Locally',
                      ServiceCall.localSave(),
                      seconds: 5,
                    ));
                  }),
              _listItem(
                  image: _listIcon(Icons.view_carousel),
                  title: const Text('Local: YAML'),
                  onTap: () async {
                    await Get.dialog(_option(
                      'Display Locally?',
                      'Display',
                      ServiceCall.localDisplay(),
                      seconds: 5,
                    ));
                  }),
              _listItem(
                  image: _listIconFromAsset(AppIcons.ICON_HAPI),
                  title: const Text('Hapi'),
                  onTap: () async {
                    await Get.dialog(_option(
                      'Upload to public Hapi Server?',
                      'Public Hapi Server',
                      ServiceCall.hapi(),
                      seconds: 5,
                    ));
                  }),
              _listItem(
                  image: _listIconFromAsset(AppIcons.ICON_MIHIN),
                  title: const Text('MiHIN'),
                  onTap: () async {
                    await Get.dialog(_option(
                      'Upload to Mihin?',
                      'Mihin server',
                      ServiceCall.mihin(),
                      seconds: 5,
                    ));
                  }),
              // todo: re-implement
              // await SubmitQuestionnaireCommand().execute();
            ],
          ),
        ),
      ),
    );
  }
}
