import 'package:flutter/material.dart';
import 'package:prapare/ui/icons.dart';
import 'package:prapare/ui/views/info/info_pages/info_page.dart';

import 'shared/info_image.dart';

class AboutPrapare extends InfoPage {
  AboutPrapare({
    Widget image = const InfoImage(svgAsset: AppIcons.INFO_CLINICAL_TRIAL_ICON),
    String title = 'About PRAPARE',
    Widget bodyWidget = const Center(
      child: Text('About PRAPARE Text.'),
    ),
  }) : super(title: title, image: image, bodyWidget: bodyWidget);
}
