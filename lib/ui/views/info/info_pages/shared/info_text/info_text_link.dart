import 'package:flutter/material.dart';

import '../shared.dart';

/// convenience widget for a RichText widget
/// with a single TextSpan that opens a URL when tapped
class InfoTextLink extends StatelessWidget {
  const InfoTextLink(this.data, this.url, {Key key}) : super(key: key);

  final String data;
  final String url;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          richSpanLink(data, url),
        ],
      ),
    );
  }
}
