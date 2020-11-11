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
    MenuOption(key: 'en', value: 'English'), //English
    MenuOption(key: 'es', value: 'Español'), //Spanish
    MenuOption(key: 'ar', value: 'عربى'), //Arabic
    MenuOption(key: 'hi', value: 'हिंदी'), //Hindi
    MenuOption(key: 'ru', value: 'русский'), //Russian
    MenuOption(key: 'bn', value: 'বাংলা'), //Bengali
    MenuOption(key: 'my', value: 'မြန်မာ'), //Burmese
    MenuOption(key: 'zh_CN', value: '简体中文'), //Chinese (Simplified)
    MenuOption(key: 'zh_TW', value: '中國傳統的'), //Chinese (Traditional)
    MenuOption(key: 'fa', value: 'فارسی'), //Farsi
    MenuOption(key: 'fr', value: 'Français'), //French
    MenuOption(key: 'de', value: 'Deutsche'), //German
    MenuOption(key: 'id', value: 'bahasa Indonesia'), //Indonesian
    MenuOption(key: 'ja', value: '日本語'), //Japanese
    MenuOption(key: 'km', value: 'ភាសាខ្មែរ'), //Khmer
    MenuOption(key: 'ko', value: '한국어'), //Korean
    MenuOption(key: 'lo', value: 'ລາວ'), //Lao
    MenuOption(key: 'mr', value: 'मराठी'), //Marathi
    MenuOption(key: 'ne', value: 'नेपाली'), //Nepali
    MenuOption(key: 'pt', value: 'Português'), //Portuguese
    MenuOption(key: 'pa', value: 'ਪੰਜਾਬੀ ਦੇ'), //Punjabi
    MenuOption(key: 'so', value: 'Soomaali'), //Somali
    MenuOption(key: 'sw', value: 'Kiswahili'), //Swahili
    MenuOption(key: 'tl', value: 'Tagalog'), //Tagalog
    MenuOption(key: 'th', value: 'ไทย'), //Thai
    MenuOption(key: 'uz', value: "O'zbekiston"), //Uzbek
    MenuOption(key: 'vi', value: 'Tiếng Việt'), //Vietnamese
  ];
}
