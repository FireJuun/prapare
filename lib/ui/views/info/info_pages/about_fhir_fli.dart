import 'package:flutter/material.dart';
import 'package:prapare/ui/icons.dart';
import 'package:prapare/ui/views/info/info_pages/info_page.dart';

import 'shared/export.dart';

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
          InfoText('Fast Healthcare Interoperability Resources (FHIR)'),
          InfoText('...with Flutter Library Integration (FLI)'),
          InfoSpacing(),
          InfoSpacing(),
          InfoText(
              'FHIR-FLI seeks to enable interoperability for the info that impacts medical care:'),
          // todo: add hyperlink
          InfoText('fhirfli.dev'),
          InfoSpacing(),
          InfoSpacing(),
          InfoText('It builds heavily on HL7 International’s FHIR standard:'),
          // todo: add hyperlink
          InfoText('hl7.org/fhir/overview.html'),
          InfoSpacing(),
          InfoSpacing(),
          InfoText('FHIR-enabled Flutter packages are available at:'),
          // todo: add hyperlink
          InfoText('pub.dev/publishers/fhirfli.dev'),
        ],
      ),
    );
  }
}
