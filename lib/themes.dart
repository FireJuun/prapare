import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// All colors used in this app can be accessed from this list
// Colors are combined in varying ways to set the themes below
class AppColors {
  static const Color greenSurface = Color(0xFFDAE7DB);
  static const Color green = Color(0xFF689E80);
  static const Color greenDark = Color(0xFF338256);
  static const Color orange = Color(0xFFE1994C);
  static const Color orangeDark = Color(0xFFC76D0D);
  static const Color orangeRed = Color(0xFFCA542B);
  static const Color red = Color(0xFFFF0C3E);
  static const Color redDark = Color(0xFF5A1A12);
  static const Color blueDark = Color(0xFF002F4E);
  static const Color blueGreen = Color(0xFF005A6C);
  static const Color greySurface = Color(0xFFE4E4E3);
  static const Color grey = Color(0xFFB5B5B5);
  static const Color greyDark = Color(0xFF636463);
  static const Color blackSurface = Color(0xFF252525);
  static const Color black = Color(0xFF181818);
  static const Color textDark = Colors.black;
  static const Color textLight = Colors.white;
}

// AppTheme inspired by: https://github.com/gskinnerTeam/flokk
// The main exception is that we don't use Provider for AppTheme
// Thus, we can't directly call the AppTheme class inside the app
enum ThemeType { Prapare, Prapare_Dark }

class AppTheme {
  static ThemeType defaultTheme = ThemeType.Prapare;

  bool isDark;
  Color bg1;
  Color bg2;
  Color surface;
  Color primary;
  Color primaryVariant;
  Color secondary;
  Color secondaryVariant;
  Color grey;
  Color error;
  Color focus;

  Color txt;
  Color accentTxt;

  /// Default constructor
  AppTheme({@required this.isDark}) {
    txt = isDark ? AppColors.textLight : AppColors.textDark;
    accentTxt = accentTxt ?? isDark ? AppColors.textDark : AppColors.textLight;
  }

  /// fromType factory constructor
  factory AppTheme.fromType(ThemeType t) {
    switch (t) {
      case ThemeType.Prapare:
        return AppTheme(isDark: false)
          ..bg1 = AppColors.greySurface
          ..bg2 = AppColors.greenSurface
          ..surface = Colors.white
          ..primary = AppColors.green
          ..primaryVariant = AppColors.greenDark
          ..secondary = AppColors.orange
          ..secondaryVariant = AppColors.orangeDark
          ..grey = AppColors.grey
          ..error = Colors.red.shade900
          ..focus = AppColors.grey;

      case ThemeType.Prapare_Dark:
        return AppTheme(isDark: true)
          ..bg1 = AppColors.black
          ..bg2 = AppColors.blueGreen
          ..surface = AppColors.blackSurface
          ..primary = AppColors.greenDark
          ..primaryVariant = AppColors.green
          ..secondary = AppColors.orangeDark
          ..secondaryVariant = AppColors.orange
          ..grey = AppColors.grey
          ..error = AppColors.red
          ..focus = AppColors.grey;
    }
    return AppTheme.fromType(defaultTheme);
  }

  ThemeData get themeData {
    var t = ThemeData.from(
      textTheme: (isDark ? ThemeData.dark() : ThemeData.light()).textTheme,
      colorScheme: ColorScheme(
          brightness: isDark ? Brightness.dark : Brightness.light,
          primary: primary,
          primaryVariant: primaryVariant,
          secondary: secondary,
          secondaryVariant: secondaryVariant,
          background: bg1,
          surface: surface,
          onBackground: txt,
          onSurface: txt,
          onError: txt,
          onPrimary: accentTxt,
          onSecondary: accentTxt,
          error: error ?? Colors.red.shade400),
    );
    return t.copyWith(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        textSelectionColor: grey,
        textSelectionHandleColor: Colors.transparent,
        buttonColor: primary,
        cursorColor: primary,
        highlightColor: primary,
        toggleableActiveColor: primary);
  }
}
