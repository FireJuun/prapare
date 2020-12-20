import 'package:flutter/material.dart';

import '../export.dart';

class TextPixabay extends StatelessWidget {
  const TextPixabay({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        richSpanText('under user: '),
        richSpanLink(
            'mcmurryjulie', 'https://pixabay.com/users/mcmurryjulie-2375405/'),
      ]),
    );
  }
}
