import 'package:flutter/material.dart';
import 'package:prapare/ui/icons.dart';
import 'package:prapare/ui/views/info/info_pages/info_page.dart';

import 'shared/export.dart';

class Disclaimer extends InfoPage {
  Disclaimer({
    Widget image = const InfoImage(AppIcons.INFO_SURVEY_ICON),
    Widget titleWidget = const InfoTitle('Disclaimer'),
    Widget bodyWidget = const _DisclaimerText(),
  }) : super(titleWidget: titleWidget, image: image, bodyWidget: bodyWidget);
}

class _DisclaimerText extends StatelessWidget {
  const _DisclaimerText({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          InfoText('This app is a demo.'),
          InfoSpacing(),
          InfoSpacing(),
          InfoText('In its current form...'),
          InfoTextBold('IT IS NOT INTENDED FOR CLINICAL USE'),
          InfoSpacing(),
          InfoSpacing(),
          InfoText('If you are interested in'),
          InfoText('using this clinically, go to:'),
          // todo: add hyperlink
          InfoTextLink('mayjuun.com/portfolio/prapare-survey',
              'https://mayjuun.com/portfolio/prapare-survey'),
          InfoSpacing(),
          InfoSpacing(),
          InfoText('We can chat.'),
        ],
      ),
    );
  }
}
