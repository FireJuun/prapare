import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prapare/ui/themes.dart';

// spec: https://github.com/delay/flutter_starter
// https://gist.github.com/RodBr/37310335c6639f486bb3c8a628052405
// https://medium.com/swlh/flutter-dynamic-themes-in-3-lines-c3b375f292e3

class ThemeController extends GetxController {
  static ThemeController get to => Get.find();

  final themeString = ''.obs;
  final store = GetStorage();
  ThemeMode _themeMode;

  ThemeMode get themeMode => _themeMode;
  String get currentTheme => themeString.value;

  @override
  void onReady() async {
    await getThemeModeFromStore();
    super.onInit();
  }

  Future<void> setThemeMode(ThemeMode value) async {
    themeString.value = value.toString().split('.')[1];
    _themeMode = value;
    Get.changeThemeMode(_themeMode);
    await store.write('theme', themeString);
    update();
  }

  ThemeMode getThemeModeFromString(String themeString) {
    ThemeMode _setThemeMode = ThemeMode.system;
    print(themeString);
    if (themeString == 'light') {
      _setThemeMode = ThemeMode.light;
    }
    if (themeString == 'dark') {
      _setThemeMode = ThemeMode.dark;
    }
    return _setThemeMode;
  }

  Future<void> getThemeModeFromStore() async {
    String _themeString = await store.read('theme') ?? 'system';
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
  AppTheme _lightTheme = AppTheme.fromType(ThemeType.Prapare);
  AppTheme get lightTheme => this._lightTheme;
  AppTheme _darkTheme = AppTheme.fromType(ThemeType.Prapare_Dark);
  AppTheme get darkTheme => this._darkTheme;

  AppTheme getAppThemeFromBrightness(Brightness b) {
    return (b == Brightness.dark) ? _darkTheme : _lightTheme;
  }
}
