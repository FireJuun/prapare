import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

// spec: https://gist.github.com/RodBr/37310335c6639f486bb3c8a628052405

class ThemeController extends GetxController {
  static ThemeController get to => Get.find();

  SharedPreferences prefs;

  // _themeMode necessary for main.dart calls
  ThemeMode _themeMode;
  ThemeMode get themeMode => this._themeMode;
  set themeMode(value) => this._themeMode = value;

  // _rxThemeMode necessary for dynamic loading of various themes
  // defaults to system on first load, then changes theme based on preferences
  Rx<ThemeMode> _rxThemeMode = ThemeMode.system.obs;
  get rxThemeMode => this._rxThemeMode.value;
  set rxThemeMode(value) => this._rxThemeMode.value = value;

  Future<void> setThemeMode(ThemeMode themeMode) async {
    Get.changeThemeMode(themeMode);
    _themeMode = themeMode;
    _rxThemeMode.value = themeMode;
    update();
    prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', themeMode.toString().split('.')[1]);
  }

  Future<void> getThemeModeFromPreferences() async {
    ThemeMode themeMode;
    prefs = await SharedPreferences.getInstance();
    String themeText = prefs.getString(('theme')) ?? 'system';
    try {
      themeMode =
          ThemeMode.values.firstWhere((e) => describeEnum(e) == themeText);
    } catch (e) {
      themeMode = ThemeMode.system;
    }
    setThemeMode(themeMode);
  }

  AppTheme theme = AppTheme.fromType(ThemeType.Prapare);
}
