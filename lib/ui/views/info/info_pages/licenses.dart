import 'package:flutter/material.dart';
import 'package:prapare/ui/icons.dart';
import 'package:prapare/ui/views/info/info_pages/info_page.dart';

import 'shared/info_image.dart';

class Licenses extends InfoPage {
  Licenses({
    Widget image = const InfoImage(
      svgAsset: AppIcons.INFO_LICENSE_ICON,
    ),
    String title = 'Licenses',
    Widget bodyWidget = const Center(
      child: Text('Licenses Text.'),
    ),
  }) : super(title: title, image: image, bodyWidget: bodyWidget);
}
