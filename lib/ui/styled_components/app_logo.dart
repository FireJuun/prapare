import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/ui/icons.dart';

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Image.asset(
        context.isDarkMode
            ? AppImages.LOGO_TAGLINE_DARK
            : AppImages.LOGO_TAGLINE,
      ),
    );
  }
}

class AppLogoNoTagline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.0,
      child: Image.asset(
        context.isDarkMode
            ? AppImages.LOGO_NO_TAGLINE_DARK
            : AppImages.LOGO_NO_TAGLINE,

        // this changes the PRAPARE logo on the survey view depending
        // on the theme (the original logo gets washed out in dark theme)
        // the colors in the new dark theme logo could use improvement
      ),
    );
  }
}
