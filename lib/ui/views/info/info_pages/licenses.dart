import 'package:flutter/material.dart';
import 'package:prapare/ui/icons.dart';
import 'package:prapare/ui/views/info/info_pages/info_page.dart';

import 'shared/shared.dart';

class Licenses extends InfoPage {
  Licenses({
    Widget image = const InfoImage(AppIcons.INFO_LICENSE_ICON),
    Widget titleWidget = const InfoTitle('Licenses'),
    Widget bodyWidget = const _LicensesText(),
  }) : super(titleWidget: titleWidget, image: image, bodyWidget: bodyWidget);
}

class _LicensesText extends StatelessWidget {
  const _LicensesText({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          TextLicense(),
          InfoSpacing(),
          InfoText('The code is available at:'),
          InfoTextLink('github.com/firejuun/prapare',
              'https://github.com/firejuun/prapare'),
          InfoSpacing(),
          InfoSpacing(),
          InfoText('Open-source packages we harnessed:'),
          TextOpenSource(),
          InfoSpacing(),
          InfoSpacing(),
          InfoText(
              'Icons used in these info screens\nare available on Pixabay.'),
          TextPixabay(),
        ],
      ),
    );
  }
}
