import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/theme_controller.dart';

class PersonalTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<ThemeController>(
      // init: ThemeController(),
      builder: (controller) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              'System Brightness: ${context.mediaQuery.platformBrightness.toString()}',
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(height: 24),
          Center(
            child: Text(
              'Theme Brightness: ${context.theme.brightness.toString()}',
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(height: 24),
          Text(
            'ThemeMode',
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.left,
          ),
          RadioListTile(
            title: Text('system'),
            value: ThemeMode.system,
            groupValue: controller.rxThemeMode,
            onChanged: (value) {
              controller.setThemeMode(value);
              controller.update();
            },
          ),
          RadioListTile(
            title: Text('dark'),
            value: ThemeMode.dark,
            groupValue: controller.rxThemeMode,
            onChanged: (value) {
              controller.setThemeMode(value);
              controller.update();
            },
          ),
          RadioListTile(
            title: Text('light'),
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
