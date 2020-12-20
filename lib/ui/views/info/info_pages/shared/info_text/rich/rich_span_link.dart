import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/commands/commands.dart';

TextSpan richSpanLink(String data, String url) {
  final context = Get.context;
  return TextSpan(
    text: data,
    style: context.textTheme.headline6.apply(
      color: (context.isDarkMode)
          ? context.theme.colorScheme.primary
          : context.theme.colorScheme.primaryVariant,
      decoration: TextDecoration.underline,
    ),
    recognizer: TapGestureRecognizer()
      ..onTap = () async => await LaunchUrlCommand().execute(url: url),
  );
}
