import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/theme_controller.dart';
import 'package:prapare/themes.dart';
import 'package:prapare/views/home.dart';

void main() {
  Get.lazyPut<ThemeController>(() => ThemeController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeController.to.getThemeModeFromPreferences();
    return GetMaterialApp(
      home: Home(),
      theme: AppTheme.fromType(ThemeType.Prapare).themeData,
      darkTheme: AppTheme.fromType(ThemeType.Prapare_Dark).themeData,
      themeMode: ThemeController.to.themeMode,
    );
  }
}
