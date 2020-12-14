import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/_internal/utils/theme_mode_util.dart';
import 'package:prapare/localization.dart';
import 'package:prapare/models/menu_options/menu_option.dart';
import 'package:prapare/ui/views/settings/settings_controller.dart';

Future<void> settingsDialog(BuildContext context) async => showDialog<void>(
      context: context,
      // barrierDismissible: false,
      builder: (BuildContext context) => _SettingsDialogContent(),
    );

class _SettingsDialogContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);

    //todo: extract into controller
    final List<MenuOption> themeOptions = [
      MenuOption(
        key: 'light',
        englishValue: 'light',
        value: labels.settings.light,
        icon: Icons.brightness_low,
      ),
      MenuOption(
        key: 'dark',
        englishValue: 'dark',
        value: labels.settings.dark,
        icon: Icons.brightness_3,
      ),
      MenuOption(
        key: 'system',
        englishValue: 'system',
        value: labels.settings.system,
        icon: Icons.brightness_4,
      ),
    ];

    final TextTheme textTheme = context.textTheme;
    return AlertDialog(
      title: Text(labels.app.settings, style: textTheme.headline5),
      content: GetX<SettingsController>(
        init: SettingsController(),
        builder: (controller) => SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              const SizedBox(height: 24),

              // *** CHOOSE THEME ***
              Center(
                  child:
                      Text(labels.app.chooseTheme, style: textTheme.bodyText1)),
              ...themeOptions.map(
                (e) => RadioListTile(
                  title: Text(e.value, style: textTheme.bodyText1),
                  subtitle: (controller.rxLanguage.value == 'en')
                      ? null
                      : Text(e.englishValue, style: textTheme.bodyText2),
                  value: ThemeModeUtil().convertStringToThemeMode(e.key),
                  groupValue: controller.rxThemeMode.value,
                  onChanged: (newValue) {
                    controller.setThemeMode(newValue);
                  },
                ),
              ),
              const SizedBox(height: 24),

              // *** CHOOSE LANGUAGE ***
              Center(
                  child: Text(labels.app.chooseLanguage,
                      style: textTheme.bodyText1)),
              ...controller.getlanguageOptions().map(
                    (e) => RadioListTile(
                      title: Text(e.value, style: textTheme.bodyText1),
                      subtitle:
                          Text(e.englishValue, style: textTheme.bodyText2),
                      value: e.key,
                      groupValue: controller.rxLanguage.value,
                      onChanged: (value) async =>
                          await controller.setLocale(value),
                    ),
                  ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: Text(labels.settings.ok, style: textTheme.headline6),
        ),
      ],
    );
  }
}
