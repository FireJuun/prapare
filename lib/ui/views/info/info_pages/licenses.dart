import 'package:flutter/material.dart';
import 'package:prapare/ui/icons.dart';
import 'package:prapare/ui/views/info/info_pages/info_page.dart';

import 'shared/export.dart';

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
          InfoText('This is an open-source app'),
          InfoText('built under the MIT license.'),
          InfoSpacing(),
          InfoText('The code is available at:'),
          // todo: add hyperlink
          InfoText('github.com/firejuun/prapare'),
          InfoSpacing(),
          InfoSpacing(),
          InfoText('Open-source packages we harnessed:'),
          // todo: add links? implement wrap?
          InfoText('''
fhir  //  fhir_at_rest  
fhir_db  //  smart_on_fhir
flutter_sheet_localization
flutter_svg
get // get_storage
http // url_launcher
translator // validators'''),
          InfoSpacing(),
          InfoSpacing(),
          InfoText('Icons in these info screens'),
          InfoText('are available on Pixabay:'),
          // todo: add hyperlink
          InfoText('user: mcmurryjulie'),
        ],
      ),
    );
  }
}
