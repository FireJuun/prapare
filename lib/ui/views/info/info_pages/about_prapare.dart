import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/ui/icons.dart';
import 'package:prapare/ui/views/info/info_pages/info_page.dart';

import 'shared/export.dart';

class AboutPrapare extends InfoPage {
  AboutPrapare({
    Widget image = const InfoImage(AppIcons.INFO_CLINICAL_TRIAL_ICON),
    Widget titleWidget = const InfoTitle('About PRAPARE'),
    Widget bodyWidget = const _AboutPrapareText(),
  }) : super(titleWidget: titleWidget, image: image, bodyWidget: bodyWidget);
}

class _AboutPrapareText extends StatelessWidget {
  const _AboutPrapareText({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          InfoText('According to:'),
          // todo: add hyperlink
          InfoText('nachc.org/research-and-data/prapare'),
          InfoSpacing(),
          InfoTextItalics(
              '''“The Protocol for Responding to and Assessing Patients’ Assets, Risks, and Experiences (PRAPARE) is a national effort to help health centers and other providers collect the data needed to better understand and act on their patients’ social determinants of health”'''),
          InfoSpacing(),
          InfoSpacing(),
          InfoText(
              'The tool is available for non-commercial use, as defined in its End User License Agreement:'),
          // todo: add hyperlink
          InfoText('nachc.org/prapare-eula'),
          InfoSpacing(),
          InfoSpacing(),
          InfoText(
              'This app’s authors are not affiliated with the PRAPARE team, nor are they affiliated with the National Association of Community Health Centers, Inc.'),
          InfoSpacing(),
          InfoSpacing(),
          InfoText('We simply took the data available at:'),
          // todo: add hyperlink
          InfoText('loinc.org/93025-5'),
          InfoSpacing(),
          InfoText('...and built it into a Flutter app'),
        ],
      ),
    );
  }
}
