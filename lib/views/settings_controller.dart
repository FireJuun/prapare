import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/theme_controller.dart';

class SettingsController extends GetxController {
  static SettingsController get to => Get.find();
  final ThemeController _themeController = Get.find();

  // _rxThemeMode necessary for dynamic loading of various themes
  // defaults to system on first load, then changes theme based on preferences
  Rx<ThemeMode> _rxThemeMode;
  get rxThemeMode => this._rxThemeMode.value;
  set rxThemeMode(value) => this._rxThemeMode.value = value;

  Future<void> setThemeMode(ThemeMode obj) async {
    await _themeController.setThemeMode(obj);
    _rxThemeMode.value = obj;
    update();
  }

  @override
  void onInit() {
    _rxThemeMode = _themeController.themeMode.obs;
    super.onInit();
  }
}
