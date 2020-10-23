import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Image(
        image: AssetImage('assets/images/PRAPARE-Logo-with-tagline.png'),
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
            ? 'assets/images/PRAPARE-Logo-no-tagline.png'
            : 'assets/images/PRAPARE-Logo-no-tagline-dark.png',
        // this changes the PRAPARE logo on the survey view depending
        // on the theme (the original logo gets washed out in dark theme)
        // the colors in the new dark theme logo could use improvement
      ),
    );
  }
}
