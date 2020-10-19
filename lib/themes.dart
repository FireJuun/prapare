import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// All colors used in this app can be accessed from this list
// Colors are combined in varying ways to set the themes below
class _AppColors {
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
  static const Color blackBackground = Color(0xFF181818);
  static const Color textDark = Colors.black;
  static const Color textLight = Colors.white;
}

TextTheme _buildTextTheme() {
  return TextTheme(
    headline1: _style(96.0, FontWeight.normal),
    headline2: _style(60.0, FontWeight.bold),
    headline3: _style(48.0, FontWeight.normal),
    headline4: _style(36.0, FontWeight.bold),
    headline5: _style(32.0, FontWeight.normal),
    headline6: _style(20.0, FontWeight.w500),
    bodyText1: _style(18.0, FontWeight.normal),
    bodyText2: _style(14.0, FontWeight.normal),
    subtitle1: _style(16.0, FontWeight.normal),
    subtitle2: _style(14.0, FontWeight.normal),
    button: _style(18.0, FontWeight.normal),
    caption: _style(12.0, FontWeight.normal),
    overline: _style(16.0, FontWeight.normal),
    // );
  ).apply(fontFamily: 'Lato');
}

TextStyle _style(double s, FontWeight w) =>
    TextStyle(fontSize: s, fontWeight: w);

// AppTheme inspired by: https://github.com/gskinnerTeam/flokk
// The main exception is that we're using Get instead of Provider for AppTheme
// Thus, we use the ThemeController to directly call AppTheme
// and context.textTheme (instead of Get.textTheme) to ensure the theme is mutable
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
  Color heading1;
  Color heading2;
  Color heading3;
  Color heading4;
  Color heading5;
  Color grey;
  Color error;
  Color focus;

  Color txt;
  Color accentTxt;

  /// Default constructor
  AppTheme({@required this.isDark}) {
    txt = isDark ? _AppColors.textLight : _AppColors.textDark;
    accentTxt =
        accentTxt ?? isDark ? _AppColors.textDark : _AppColors.textLight;
  }

  /// fromType factory constructor
  factory AppTheme.fromType(ThemeType t) {
    switch (t) {
      case ThemeType.Prapare:
        return AppTheme(isDark: false)
          ..bg1 = _AppColors.greySurface
          ..bg2 = _AppColors.greenSurface
          ..surface = Colors.white
          ..primary = _AppColors.green
          ..primaryVariant = _AppColors.greenDark
          ..secondary = _AppColors.orange
          ..secondaryVariant = _AppColors.orangeDark
          ..heading1 = _AppColors.orangeRed
          ..heading2 = _AppColors.blueDark
          ..heading3 = _AppColors.redDark
          ..heading4 = _AppColors.blueGreen
          ..heading5 = _AppColors.greyDark
          ..grey = _AppColors.grey
          ..error = Colors.red.shade900
          ..focus = _AppColors.grey;

      case ThemeType.Prapare_Dark:
        return AppTheme(isDark: true)
          ..bg1 = _AppColors.blackBackground
          ..bg2 = _AppColors.blueGreen
          ..surface = _AppColors.blackSurface
          ..primary = _AppColors.greenDark
          ..primaryVariant = _AppColors.green
          ..secondary = _AppColors.orangeDark
          ..secondaryVariant = _AppColors.orange
          ..heading1 = _AppColors.orangeRed
          ..heading2 = _AppColors.blueDark
          ..heading3 = _AppColors.redDark
          ..heading4 = _AppColors.blueGreen
          ..heading5 = _AppColors.greyDark
          ..grey = _AppColors.grey
          ..error = _AppColors.red
          ..focus = _AppColors.grey;
    }
    return AppTheme.fromType(defaultTheme);
  }

  ThemeData get themeData {
    var t = ThemeData.from(
      textTheme: _buildTextTheme(),
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
        typography: Typography.material2018(),
        accentTextTheme: _buildTextTheme().apply(bodyColor: accentTxt),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        textSelectionColor: grey,
        textSelectionHandleColor: Colors.transparent,
        buttonColor: primary,
        cursorColor: primary,
        highlightColor: primary,
        toggleableActiveColor: primary);
  }
}
