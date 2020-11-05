import 'package:prapare/models/data/menu_option.dart';

class MenuOptionsModel {
  static final String defaultLanguage = 'en';
  // spec: https://github.com/delay/flutter_starter
  // List of languages that are supported.  Used in selector.
  // Follow this plugin for translating a google sheet to languages
  // https://github.com/aloisdeniel/flutter_sheet_localization
  // Flutter App translations google sheet
  // https://docs.google.com/spreadsheets/d/1oS7iJ6ocrZBA53SxRfKF0CG9HAaXeKtzvsTBhgG4Zzk/edit?usp=sharing

  static final List<MenuOption> languageOptions = [
    MenuOption(key: "zh", value: "中文"), //Chinese
    MenuOption(key: "de", value: "Deutsche"), //German
    MenuOption(key: "en", value: "English"), //English
    MenuOption(key: "es", value: "Español"), //Spanish
    MenuOption(key: "fr", value: "Français"), //French
    MenuOption(key: "hi", value: "हिन्दी"), //Hindi
    MenuOption(key: "ja", value: "日本語"), //Japanese
    MenuOption(key: "pt", value: "Português"), //Portuguese
    MenuOption(key: "ru", value: "русский"), //Russian
  ];
}
