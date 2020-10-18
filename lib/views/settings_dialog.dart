import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/theme_controller.dart';
import 'package:prapare/strings.dart';

class SettingsDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = context.textTheme;
    return GetX<ThemeController>(
      builder: (controller) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(S.STG_THEME_MODE, style: textTheme.bodyText1),
          RadioListTile(
            title: Text(S.STG_THEME_SYSTEM, style: textTheme.bodyText1),
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
            title: Text(S.STG_THEME_LIGHT, style: textTheme.bodyText1),
            value: ThemeMode.light,
            groupValue: controller.rxThemeMode,
            onChanged: (value) => controller.setThemeMode(value),
          ),
        ],
      ),
    );
  }
}
