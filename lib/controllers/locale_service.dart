import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/_internal/utils/localization/available_languages.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// spec: https://gist.github.com/RodBr/37310335c6639f486bb3c8a628052405
/// Like Theme, uses SharedPreferences to set language

class LocaleService extends GetxService {
  static LocaleService get to => Get.find();

  SharedPreferences prefs;

  // todo: test different locales, handle optional country codes
  Locale _activeLocale;
  Locale get activeLocale => this._activeLocale;
  set activeLocale(value) => this._activeLocale = value;

  Locale getPlatformLocale() => Locale(Platform.localeName.split('_')[0]);

  List<Map<String, String>> getAvailableLanguages() => availableLanguages();

  List<Locale> getAvailableLocales() =>
      getAvailableLanguages().map((e) => Locale(e['iso369-1'])).toList();

  Future<void> setLocale(Locale obj) async {
    // Change theme, then update ThemeMode notifiers
    Get.updateLocale(obj);
    _activeLocale = obj;

    // Save data for later retrieval
    prefs = await SharedPreferences.getInstance();
    await prefs.setString('locale', activeLocale.languageCode.toString());
  }

  Future<void> getLocaleFromPreferences() async {
    prefs = await SharedPreferences.getInstance();
    String localeName =
        prefs.getString(('locale')) ?? getPlatformLocale().toString();
    try {
      _activeLocale = Locale(localeName);
    } catch (e) {
      _activeLocale = getPlatformLocale();
    }
  }

  Future<LocaleService> init() async {
    await getLocaleFromPreferences();
    return this;
  }
}
