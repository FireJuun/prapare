import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/theme_controller.dart';

class PersonalTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = context.textTheme;
    return GetX<ThemeController>(
      builder: (controller) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              'System Brightness: ${context.mediaQuery.platformBrightness.toString()}',
              style: textTheme.bodyText1,
            ),
          ),
          SizedBox(height: 24),
          Center(
            child: Text(
              'Theme Brightness: ${context.theme.brightness.toString()}',
              style: textTheme.bodyText1,
            ),
          ),
          SizedBox(height: 24),
          Text(
            'ThemeMode',
            style: textTheme.bodyText1,
            textAlign: TextAlign.left,
          ),
          RadioListTile(
            title: Text('system', style: textTheme.bodyText1),
            value: ThemeMode.system,
            groupValue: controller.rxThemeMode,
            onChanged: (value) {
              controller.setThemeMode(value);
              controller.update();
            },
          ),
          RadioListTile(
            title: Text('dark', style: textTheme.bodyText1),
            value: ThemeMode.dark,
            groupValue: controller.rxThemeMode,
            onChanged: (value) {
              controller.setThemeMode(value);
              controller.update();
            },
          ),
          RadioListTile(
            title: Text('light', style: textTheme.bodyText1),
            value: ThemeMode.light,
            groupValue: controller.rxThemeMode,
            onChanged: (value) {
              controller.setThemeMode(value);
              controller.update();
            },
          ),
        ],
      ),
    );
  }
}
