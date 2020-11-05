import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/controllers.dart';

class SettingsController extends GetxController {
  static SettingsController get to => Get.find();

  final ThemeService _themeController = Get.find();
  final LocaleService _localeService = Get.find();

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

  // _rxLocale necessary for dynamic loading of locale checkbox
  // defaults to system on first load, then changes based on preferences
  Rx<Locale> _rxLocale;
  get rxLocale => this._rxLocale.value;
  set rxLocale(value) => this._rxLocale.value = value;

  Future<void> setLocale(Locale obj) async {
    await _localeService.setLocale(obj);
    _rxLocale.value = obj;
    update();
  }

  @override
  void onInit() {
    _rxThemeMode = _themeController.themeMode.obs;
    super.onInit();
  }
}
