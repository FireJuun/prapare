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
        'assets/images/PRAPARE-Logo-no-tagline.png',
      ),
    );
  }
}
