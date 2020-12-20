import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/commands/commands.dart';

class InfoTextLink extends StatelessWidget {
  const InfoTextLink(this.data, this.url, {Key key}) : super(key: key);

  final String data;
  final String url;

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
        text: data,
        style: context.textTheme.headline6.apply(
          color: (context.isDarkMode)
              ? context.theme.colorScheme.primary
              : context.theme.colorScheme.primaryVariant,
          decoration: TextDecoration.underline,
        ),
        recognizer: TapGestureRecognizer()
          ..onTap = () async => await LaunchUrlCommand().execute(url: url),
      )
    ]));
  }
}
