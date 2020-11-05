import 'package:get/utils.dart';

// ignore_for_file: non_constant_identifier_names
class _Strings {
  static _Strings instance = _Strings();

  String TITLE_PERSONAL = "Personal Characteristics".tr;
  String TITLE_HOME = "Family and Home".tr;
  String TITLE_MONEY = "Money and Resources".tr;
  String TITLE_SOCIAL = "Social and Emotional Health".tr;
  String TITLE_OTHER = "Optional Measures".tr;

  //todo: automate connection of string to PRAPARE survey data
  String CODE_PERSONAL = "/93043-8";
  String CODE_HOME = "/93042-0";
  String CODE_MONEY = "/93041-2";
  String CODE_SOCIAL = "/93040-4";
  String CODE_OTHER = "/93039-6";
}

_Strings get S => _Strings.instance;
