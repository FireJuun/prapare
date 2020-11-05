import 'package:get/utils.dart';

// ignore_for_file: non_constant_identifier_names
class _Strings {
  static _Strings instance = _Strings();

  String TITLE_PERSONAL = "Personal Characteristics".tr;
  String TITLE_HOME = "Family and Home".tr;
  String TITLE_MONEY = "Money and Resources".tr;
  String TITLE_SOCIAL = "Social and Emotional Health".tr;
  String TITLE_OTHER = "Optional Measures".tr;

  String BTN_NEW_SURVEY = "New Survey".tr;
  String BTN_EDIT_SURVEY = "Edit Survey".tr;
  String BTN_SUBMIT_SHARE = "Submit/Share".tr;
  String BTN_OK = "OK".tr;

  String STG_TITLE = "App Settings".tr;
  String STG_THEME_MODE = "Choose Theme".tr;
  String STG_THEME_SYSTEM = "System".tr;
  String STG_THEME_DARK = "Dark".tr;
  String STG_THEME_LIGHT = "Light".tr;
  String STG_LANGUAGE = "Choose Language".tr;

  //todo: automate connection of string to PRAPARE survey data
  String CODE_PERSONAL = "/93043-8";
  String CODE_HOME = "/93042-0";
  String CODE_MONEY = "/93041-2";
  String CODE_SOCIAL = "/93040-4";
  String CODE_OTHER = "/93039-6";
}

_Strings get S => _Strings.instance;

// todo: automate generation of stringList ?via iterable
/// ! Important: disable .tr extensions before updating strings
/// For now, stringList is only used in this terminal command: `dart lib/_internal/utils/localization/refresh_languages.dart`
/// Prior to running this, you need to disable [package:get/utils.dart] and remove all [.tr] extensions
/// This is because dart cannot interpret Flutter libraries, including [dart:ui]
///

List<String> get stringList => [
      S.TITLE_PERSONAL,
      S.TITLE_HOME,
      S.TITLE_MONEY,
      S.TITLE_SOCIAL,
      S.TITLE_OTHER,
      S.BTN_NEW_SURVEY,
      S.BTN_EDIT_SURVEY,
      S.BTN_SUBMIT_SHARE,
      S.BTN_OK,
      S.STG_TITLE,
      S.STG_THEME_MODE,
      S.STG_THEME_SYSTEM,
      S.STG_THEME_DARK,
      S.STG_THEME_LIGHT,
      S.STG_LANGUAGE,
    ];
