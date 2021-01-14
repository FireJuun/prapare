import 'package:flutter/material.dart';
import 'package:prapare/ui/icons.dart';
import 'package:prapare/ui/views/info/info_pages/info_page.dart';

import 'shared/shared.dart';

class AboutFhirFli extends InfoPage {
  AboutFhirFli({
    Widget image = const InfoImage(AppIcons.INFO_STETHOSCOPE_ICON),
    Widget titleWidget = const InfoTitle('About FHIR-FLI'),
    Widget bodyWidget = const _AboutFhirFliText(),
  }) : super(titleWidget: titleWidget, image: image, bodyWidget: bodyWidget);
}

class _AboutFhirFliText extends StatelessWidget {
  const _AboutFhirFliText({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          TextFhirFli(),
          InfoSpacing(),
          InfoSpacing(),
          InfoText(
              'FHIR-FLI seeks to enable interoperability for the info that impacts medical care:'),
          InfoTextLink('fhirfli.dev', 'https://fhirfli.dev'),
          InfoSpacing(),
          InfoSpacing(),
          InfoText('It builds heavily on HL7 International’s FHIR standard:'),
          InfoTextLink('hl7.org/fhir/overview.html',
              'https://hl7.org/fhir/overview.html'),
          InfoSpacing(),
          InfoSpacing(),
          InfoText('FHIR-enabled Flutter\npackages are available at:'),
          InfoTextLink('pub.dev/publishers/fhirfli.dev',
              'https://pub.dev/publishers/fhirfli.dev'),
        ],
      ),
    );
  }
}
