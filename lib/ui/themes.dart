import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// All colors used in this app can be accessed from this list
// Colors are combined in varying ways to set the themes below
class _AppColors {
  static const Color greenSurface = Color(0xFFDAE7DB);
  //this is the pale faded green color of the background of the survey in light theme
  static const Color greenSurfaceDark = Color(0xFF417B5B);
  static const Color green = Color(0xFF689E80);
  //this is the medium green color used for the PRAPARE banner and the button on the home screen
  static const Color greenDark = Color(0xFF357150);
  //in contrast, this is the color used just for the button shadow on the home screen, NOT for the PRAPARE banner
//todo figure out why "green" is the color for both the button shadow
//on the home view as well as the banner color behind the PRAPARE logo
//on the survey views, but greenDark is ONLY used for the button, not the banner
  static const Color orange = Color(0xFFE1994C);
  //this is the orange color only used for the surface of the "New Survey" button on the home screen
  static const Color orangeDark = Color(0xFFd1893C);
  //this is the orange color only used for the surface of the "New Survey" button on the home screen in dark mode
  static const Color orangeRed = Color(0xFFCA542B);
  //this is the orange (slightly red) color in the light mode "Personal Characteristics" banner
  static const Color orangeRedDarkMode = Color(0xFFB16C54);
  //this is the dark mode "personal characteristics" banner - 773422
  static const Color red = Color(0xff621c1c);
  //this is the light mode "money and resources" banner
  static const Color redDarkMode = Color(0xFF984F46);
  //this is the dark mode "money and resources" banner
  static const Color blue = Color(0xFF567599);
  //this is the blue 'prapare' logo color and text when completed in light mode
  // static const Color blueTextComplete = Color(0xFF004270);
  //this is the light mode "family and home" banner color
  static const Color blueDarkMode = Color(0xFF427699);
  //this is the dark mode "family and home" banner - FF002F4E
  static const Color blueGreen = Color(0xFF005A6C);
  //this is the light mode "social and emotional health" banner
  static const Color blueGreenDarkMode = Color(0xFF277787);
  //this is the dark mode "social and emotional health" banner
  static const Color greySurface = Color(0xFFE4E4E3);
  //this is the light mode color used for the home view background and the settings menu background
  // static const Color greySurfaceDark = Color(0xff484847);
  //not currently being used
  static const Color grey = Color(0xFF636463);
  //this is the light mode "optional measures" banner
  static const Color greyDisabled = Color(0xFFB5B5B5);
  // disabled grey for bottom nav bar
  static const Color greyDarkMode = Color(0xFF4B4949);
  //this is the dark mode "optional measures" banner
  static const Color blackSurface = Color(0xff050505);
  //this is the dark mode "PRAPARE" banner color - 052505
  // static const Color blackSurfaceDark = Color(0xFFE4E4E3);
  //not currently being used
  static const Color blackBackground = Color(0xff181818);
  //this is the dark mode color used for the home view background and the settings menu
  static const Color textDark = Colors.black;
  //this is the text color for the dark mode banners (personal characteristics, family and home, etc)
  static const Color textLight = Color(0xFFf7f7f7);
  //this is the text color for the light mode banners (personal characteristics, family and home, etc)
}

TextTheme _buildTextTheme() {
  return TextTheme(
    headline1: _style(96.0, FontWeight.normal),
    headline2: _style(60.0, FontWeight.bold),
    headline3: _style(48.0, FontWeight.normal),
    headline4: _style(36.0, FontWeight.bold),
    headline5: _style(30.0, FontWeight.normal),
    headline6: _style(19.0, FontWeight.w500),
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
          ..heading2 = _AppColors.blue
          ..heading3 = _AppColors.red
          ..heading4 = _AppColors.blueGreen
          ..heading5 = _AppColors.grey
          ..textComplete = _AppColors.greenSurfaceDark
          ..textLight = _AppColors.textLight
          ..disabled = _AppColors.greyDisabled
          ..grey = _AppColors.grey
          ..error = Colors.red.shade900
          ..focus = _AppColors.grey;

      case ThemeType.Prapare_Dark:
        return AppTheme(isDark: true)
          ..bg1 = _AppColors.blackBackground
          ..bg2 = _AppColors.greyDarkMode
          ..surface = _AppColors.blackSurface
          ..primary = _AppColors.orangeDark
          ..primaryVariant = _AppColors.orange
          ..secondary = _AppColors.greenDark
          ..secondaryVariant = _AppColors.green
          ..heading1 = _AppColors.orangeRedDarkMode
          ..heading2 = _AppColors.blueDarkMode
          ..heading3 = _AppColors.redDarkMode
          ..heading4 = _AppColors.blueGreenDarkMode
          ..heading5 = _AppColors.greyDarkMode
          ..textComplete = _AppColors.orangeDark
          ..textLight = _AppColors.textLight
          ..disabled = _AppColors.greyDisabled
          ..grey = _AppColors.grey
          ..error = _AppColors.redDarkMode
          ..focus = _AppColors.grey;
    }
    return AppTheme.fromType(defaultTheme);
  }

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
  Color textComplete;
  Color textLight;
  Color disabled;
  Color grey;
  Color error;
  Color focus;

  Color txt;
  Color accentTxt;

  ThemeData get themeData {
    final t = ThemeData.from(
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
