import 'package:flutter/material.dart';

import '../export.dart';

class TextOpenSource extends StatelessWidget {
  const TextOpenSource({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // fields called inside build method...so they are updated when theme updates
    final _blank = richSpanText('');
    final _separator = richSpanText(' // ');

    final _openSourceList = [
      [
        richSpanLink('fhir', 'https://pub.dev/packages/fhir'),
        _separator,
        richSpanLink('fhir_at_rest', 'https://pub.dev/packages/fhir_at_rest'),
      ],
      [
        richSpanLink('fhir_db', 'https://pub.dev/packages/fhir_db'),
        _separator,
        richSpanLink(
            'smart_on_fhir', 'https://github.com/fhir-fli/smart_on_fhir'),
      ],
      [_blank],
      [
        richSpanLink('flutter_sheet_localization',
            'https://pub.dev/packages/flutter_sheet_localization'),
      ],
      [
        richSpanLink('flutter_svg', 'https://pub.dev/packages/flutter_svg'),
        _separator,
        richSpanLink('flutter_launcher_icons',
            'https://pub.dev/packages/flutter_launcher_icons'),
      ],
      [_blank],
      [
        richSpanLink('get', 'https://pub.dev/packages/get'),
        _separator,
        richSpanLink('get_storage', 'https://pub.dev/packages/get_storage'),
      ],
      [
        richSpanLink('http', 'https://pub.dev/packages/http'),
        _separator,
        richSpanLink('url_launcher', 'https://pub.dev/packages/url_launcher'),
      ],
      [
        richSpanLink('translator', 'https://pub.dev/packages/translator'),
        _separator,
        richSpanLink('validators', 'https://pub.dev/packages/validators'),
      ],
    ];

    return Column(
      children: [
        ..._openSourceList.map(
          (e) => RichText(
            text: TextSpan(children: e),
          ),
        ),
      ],
    );
  }
}
