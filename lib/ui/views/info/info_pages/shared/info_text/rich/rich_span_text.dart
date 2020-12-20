import 'package:flutter/material.dart';
import 'package:get/get.dart';

TextSpan richSpanText(String data) {
  final context = Get.context;
  return TextSpan(
    text: data,
    style: context.textTheme.headline6,
  );
}
