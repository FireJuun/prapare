import 'package:flutter/material.dart';

class ThemeModeUtil {
  ThemeMode convertStringToThemeMode(String obj) {
    switch (obj) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
        return ThemeMode.system;
      default:
        return ThemeMode.system;
    }
  }

  String convertThemeModeToString(ThemeMode obj) =>
      obj.toString().split('.')[1];
}
