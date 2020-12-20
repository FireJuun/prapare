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
          InfoText('IT IS NOT INTENDED FOR CLINICAL USE'),
          InfoText('in its current form.'),
          InfoSpacing(),
          InfoText('If you are interested in using this clinically,'),
          InfoText('go to:'),
          InfoSpacing(),
          // todo: add hyperlink
          InfoText('mayjuun.com/portfolio/prapare-survey'),
          InfoSpacing(),
          InfoText('We can chat.'),
        ],
      ),
    );
  }
}
