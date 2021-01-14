import 'package:flutter/material.dart';

import '../export.dart';

class TextLicense extends StatelessWidget {
  const TextLicense({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        richSpanText('This is an open-source app\nbuilt under the '),
        richSpanLink('MIT license',
            'https://github.com/FireJuun/prapare/blob/main/LICENSE'),
      ]),
    );
  }
}
