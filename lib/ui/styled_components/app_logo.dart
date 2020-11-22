import 'package:flutter/material.dart';
import 'package:prapare/ui/icons.dart';

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Image(
        image: AssetImage(AppImages.LOGO_TAGLINE),
      ),
    );
  }
}

class AppLogoNoTagline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Image.asset(
        Theme.of(context).brightness == Brightness.light
            ? AppImages.LOGO_NO_TAGLINE
            : AppImages.LOGO_NO_TAGLINE_DARK,
        // this changes the PRAPARE logo on the survey view depending
        // on the theme (the original logo gets washed out in dark theme)
        // the colors in the new dark theme logo could use improvement
      ),
    );
  }
}
