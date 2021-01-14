import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/_internal/utils/theme_mode_util.dart';
import 'package:prapare/ui/themes.dart';

import 'controllers.dart';

// spec: https://github.com/delay/flutter_starter
// https://gist.github.com/RodBr/37310335c6639f486bb3c8a628052405
// https://medium.com/swlh/flutter-dynamic-themes-in-3-lines-c3b375f292e3

class ThemeController extends GetxController {
  static ThemeController get to => Get.find();

  final StorageController _data = Get.find();

  final themeString = ''.obs;

  ThemeMode _themeMode;

  ThemeMode get themeMode => _themeMode;
  String get currentTheme => themeString.value;

  @override
  Future<void> onReady() async {
    await getThemeModeFromStore();
    super.onReady();
  }

  Future<void> setThemeMode(ThemeMode obj) async {
    themeString.value = ThemeModeUtil().convertThemeModeToString(obj);
    _themeMode = obj;
    Get.changeThemeMode(_themeMode);
    await _data.store.write('theme', themeString.value);
    update();
  }

  ThemeMode getThemeModeFromString(String theme) {
    ThemeMode _setThemeMode = ThemeMode.system;
    if (theme == 'light') {
      _setThemeMode = ThemeMode.light;
    }
    if (theme == 'dark') {
      _setThemeMode = ThemeMode.dark;
    }
    return _setThemeMode;
  }

  Future<void> getThemeModeFromStore() async {
    final String _themeString = await _data.store.read('theme') ?? 'system';
    setThemeMode(getThemeModeFromString(_themeString));
  }

  // checks whether darkmode is set via system or previously by user
  bool get isDarkModeOn {
    if (currentTheme == 'system') {
      if (WidgetsBinding.instance.window.platformBrightness ==
          Brightness.dark) {
        return true;
      }
    }
    if (currentTheme == 'dark') {
      return true;
    }
    return false;
  }

  // App Themes (Light vs Dark)
  final AppTheme _lightTheme = AppTheme.fromType(ThemeType.Prapare);
  AppTheme get lightTheme => _lightTheme;
  final AppTheme _darkTheme = AppTheme.fromType(ThemeType.Prapare_Dark);
  AppTheme get darkTheme => _darkTheme;

  AppTheme getAppThemeFromBrightness(Brightness b) {
    return (b == Brightness.dark) ? _darkTheme : _lightTheme;
  }
}
