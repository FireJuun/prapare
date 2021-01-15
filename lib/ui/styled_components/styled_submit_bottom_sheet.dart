import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/services/services.dart';
import 'package:prapare/ui/localization.dart';

class StyledSubmitBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);

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
                await service.call();
                await Future.delayed(Duration(seconds: seconds ?? 0));
              },
            ),
          ],
        );

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Wrap(
          children: <Widget>[
            ListTile(
                title: const Text('Local - Save'),
                onTap: () async {
                  await Get.dialog(_option(
                    'Save locally?',
                    'Saving Locally',
                    ServiceCall.localSave(),
                    seconds: 5,
                  ));
                }),
            ListTile(
                title: const Text('Local - Show'),
                onTap: () async {
                  await Get.dialog(_option(
                    'Display Locally?',
                    'Display',
                    ServiceCall.localDisplay(),
                    seconds: 5,
                  ));
                }),
            ListTile(
                title: const Text('Hapi'),
                onTap: () async {
                  await Get.dialog(_option(
                    'Upload to public Hapi Server?',
                    'Public Hapi Server',
                    ServiceCall.hapi(),
                    seconds: 5,
                  ));
                }),
            ListTile(
                title: const Text('Mihin'),
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
    );
  }
}
