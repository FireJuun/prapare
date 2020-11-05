import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/ui/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

// spec: https://gist.github.com/RodBr/37310335c6639f486bb3c8a628052405

class ThemeService extends GetxService {
  static ThemeService get to => Get.find();

  SharedPreferences prefs;

  // App Themes (Light vs Dark)
  AppTheme _lightTheme = AppTheme.fromType(ThemeType.Prapare);
  AppTheme get lightTheme => this._lightTheme;
  AppTheme _darkTheme = AppTheme.fromType(ThemeType.Prapare_Dark);
  AppTheme get darkTheme => this._darkTheme;

  // _themeMode necessary for main.dart calls
  ThemeMode _themeMode;
  ThemeMode get themeMode => this._themeMode;
  set themeMode(value) => this._themeMode = value;

  Future<void> setThemeMode(ThemeMode obj) async {
    // Change theme, then update ThemeMode notifiers
    Get.changeThemeMode(obj);
    _themeMode = obj;

    // Save data for later retrieval
    prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', themeMode.toString().split('.')[1]);
  }

  Future<void> getThemeModeFromPreferences() async {
    prefs = await SharedPreferences.getInstance();
    String themeText = prefs.getString(('theme')) ?? 'system';
    try {
      _themeMode =
          ThemeMode.values.firstWhere((e) => describeEnum(e) == themeText);
    } catch (e) {
      _themeMode = ThemeMode.system;
    }
  }

  AppTheme getAppThemeFromBrightness(Brightness b) {
    return (b == Brightness.dark) ? _darkTheme : _lightTheme;
  }

  Future<ThemeService> init() async {
    await getThemeModeFromPreferences();
    return this;
  }
}
