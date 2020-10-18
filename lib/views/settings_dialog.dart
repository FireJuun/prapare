import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/theme_controller.dart';
import 'package:prapare/strings.dart';

Future<void> settingsDialog() async =>
    await Get.dialog(_SettingsDialogContent());

class _SettingsDialogContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = context.textTheme;
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 24.0),
        child: Column(
          children: [
            Center(child: Text(S.STG_TITLE, style: textTheme.headline5)),
            Expanded(
              child: GetX<ThemeController>(
                builder: (controller) => ListView(
                  children: <Widget>[
                    SizedBox(height: 24),
                    Center(
                        child:
                            Text(S.STG_THEME_MODE, style: textTheme.bodyText1)),
                    RadioListTile(
                      title:
                          Text(S.STG_THEME_SYSTEM, style: textTheme.bodyText1),
                      value: ThemeMode.system,
                      groupValue: controller.rxThemeMode,
                      onChanged: (value) => controller.setThemeMode(value),
                    ),
                    RadioListTile(
                      title: Text(S.STG_THEME_DARK, style: textTheme.bodyText1),
                      value: ThemeMode.dark,
                      groupValue: controller.rxThemeMode,
                      onChanged: (value) => controller.setThemeMode(value),
                    ),
                    RadioListTile(
                      title:
                          Text(S.STG_THEME_LIGHT, style: textTheme.bodyText1),
                      value: ThemeMode.light,
                      groupValue: controller.rxThemeMode,
                      onChanged: (value) => controller.setThemeMode(value),
                    ),
                    SizedBox(height: 24),
                    Center(
                        child:
                            Text(S.STG_LANGUAGE, style: textTheme.bodyText1)),
                    Center(child: Text('...', style: textTheme.bodyText1)),
                  ],
                ),
              ),
            ),
            TextButton(
                onPressed: () => Get.back(),
                child: Text(S.BTN_OK, style: textTheme.headline6))
          ],
        ),
      ),
    );
  }
}
