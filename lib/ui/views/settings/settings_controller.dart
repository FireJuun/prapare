import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/controllers.dart';
import 'package:prapare/models/data/menu_option.dart';

class SettingsController extends GetxController {
  static SettingsController get to => Get.find();

  final ThemeController _themeController = Get.find();
  final LocaleController _localeController = Get.find();

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

  // _rxLanguage necessary for dynamic loading of locale checkbox
  // defaults to system on first load, then changes based on preferences
  RxString _rxLanguage;
  get rxLanguage => this._rxLanguage.value;
  set rxLanguage(value) => this._rxLanguage.value = value;

  Future<void> setLocale(String obj) async {
    await _localeController.updateLanguage(obj);
    _rxLanguage.value = obj;
    Get.forceAppUpdate();
    update();
  }

  List<MenuOption> getlanguageOptions() => _localeController.languageOptions;

  @override
  void onInit() {
    _rxThemeMode = _themeController.themeMode.obs;
    _rxLanguage = _localeController.currentLanguage.obs;
    super.onInit();
  }
}
