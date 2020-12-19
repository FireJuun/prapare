import 'package:flutter/material.dart';
import 'package:prapare/ui/icons.dart';
import 'package:prapare/ui/views/info/info_pages/info_page.dart';

import 'shared/info_image.dart';

class AboutFhirFli extends InfoPage {
  AboutFhirFli({
    Widget image = const InfoImage(
      svgAsset: AppIcons.INFO_STETHOSCOPE_ICON,
    ),
    String title = 'About FHIR-FLI',
    Widget bodyWidget = const Center(
      child: Text('About FHIR-FLI Text.'),
    ),
  }) : super(title: title, image: image, bodyWidget: bodyWidget);
}
