import 'package:flutter/material.dart';
import 'package:prapare/ui/icons.dart';
import 'package:prapare/ui/views/info/info_pages/info_page.dart';

import 'shared/info_image.dart';

class Disclaimer extends InfoPage {
  Disclaimer({
    Widget image = const InfoImage(
      svgAsset: AppIcons.INFO_SURVEY_ICON,
    ),
    String title = 'Disclaimer',
    Widget bodyWidget = const Center(
      child: Text('Disclaimer Text.'),
    ),
  }) : super(title: title, image: image, bodyWidget: bodyWidget);
}
