// ignore_for_file: non_constant_identifier_names
class _Strings {
  static _Strings instance = _Strings();

  //todo: automate connection of string to PRAPARE survey data
  String CODE_PERSONAL = '/93043-8';
  String CODE_HOME = '/93042-0';
  String CODE_MONEY = '/93041-2';
  String CODE_SOCIAL = '/93040-4';
  String CODE_OTHER = '/93039-6';
}

_Strings get S => _Strings.instance;
