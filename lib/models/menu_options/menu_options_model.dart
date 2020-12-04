import 'package:prapare/models/menu_options/menu_option.dart';

class MenuOptionsModel {
  static const String defaultLanguage = 'en';

  // spec: https://github.com/delay/flutter_starter
  // List of languages that are supported.  Used in selector.
  // Follow this plugin for translating a google sheet to languages
  // https://github.com/aloisdeniel/flutter_sheet_localization
  // Flutter App translations google sheet
  // https://docs.google.com/spreadsheets/d/1oS7iJ6ocrZBA53SxRfKF0CG9HAaXeKtzvsTBhgG4Zzk/edit?usp=sharing

  static final List<MenuOption> languageOptions = [
    MenuOption(key: 'en', englishValue: 'English', value: 'English'),
    MenuOption(key: 'es', englishValue: 'Spanish', value: 'Español'),
    MenuOption(key: 'ar', englishValue: 'Arabic', value: 'عربى'),
    MenuOption(key: 'bn', englishValue: 'Bengali', value: 'বাংলা'),
    MenuOption(key: 'my', englishValue: 'Burmese', value: 'မြန်မာ'),

    // spec: https://flutter.dev/docs/development/accessibility-and-localization/internationalization#advanced-locale-definition
    // For Chinese, multiple options exist based on languageCode, scriptCode, and countryCode
    MenuOption(
      key: 'zh',
      englishValue: 'Chinese, generic',
      value: '中国，一般',
    ),
    // todo: re-implement Chinese locale variations
    // MenuOption(
    //   key: 'zh_Hans',
    //   englishValue: 'Chinese, generic simplified',
    //   value: '中国，通用简化',
    // ),
    // MenuOption(
    //   key: 'zh_Hant',
    //   englishValue: 'Chinese, generic traditional',
    //   value: '中國，通用的傳統',
    // ),
    // MenuOption(
    //   key: 'zh_Hans_CN',
    //   englishValue: 'Chinese (China)',
    //   value: '中文（中国）',
    // ),
    // MenuOption(
    //   key: 'zh_Hant_TW',
    //   englishValue: 'Chinese (Taiwan)',
    //   value: '中國（台灣）',
    // ),
    // MenuOption(
    //   key: 'zh_Hant_HK',
    //   englishValue: 'Chinese (Hong Kong)',
    //   value: '中國（香港）',
    // ),
    MenuOption(key: 'fa', englishValue: 'Farsi', value: 'فارسی'),
    MenuOption(key: 'fr', englishValue: 'French', value: 'Français'),
    MenuOption(key: 'de', englishValue: 'German', value: 'Deutsche'),
    MenuOption(key: 'hi', englishValue: 'Hindi', value: 'हिंदी'),
    MenuOption(
        key: 'id', englishValue: 'Indonesian', value: 'bahasa Indonesia'),
    MenuOption(key: 'ja', englishValue: 'Japanese', value: '日本語'),
    MenuOption(key: 'km', englishValue: 'Khmer', value: 'ភាសាខ្មែរ'),
    MenuOption(key: 'ko', englishValue: 'Korean', value: '한국어'),
    MenuOption(key: 'lo', englishValue: 'Lao', value: 'ລາວ'),
    MenuOption(key: 'mr', englishValue: 'Marathi', value: 'मराठी'),
    MenuOption(key: 'ne', englishValue: 'Nepali', value: 'नेपाली'),
    MenuOption(key: 'pt', englishValue: 'Portuguese', value: 'Português'),
    MenuOption(key: 'pa', englishValue: 'Punjabi', value: 'ਪੰਜਾਬੀ ਦੇ'),
    MenuOption(key: 'ru', englishValue: 'Russian', value: 'русский'),
    // Somali not currently supported, per https://flutter.dev/tutorials/internationalization/
    // MenuOption(key: 'so', englishValue: 'Somali', value: 'Soomaali'),
    MenuOption(key: 'sw', englishValue: 'Swahili', value: 'Kiswahili'),
    MenuOption(key: 'tl', englishValue: 'Tagalog', value: 'Tagalog'),
    MenuOption(key: 'th', englishValue: 'Thai', value: 'ไทย'),
    MenuOption(key: 'uz', englishValue: 'Uzbek', value: "O'zbekiston"),
    MenuOption(key: 'vi', englishValue: 'Vietnamese', value: 'Tiếng Việt'),
  ];
}
