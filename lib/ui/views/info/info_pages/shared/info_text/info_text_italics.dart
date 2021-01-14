import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoTextItalics extends StatelessWidget {
  const InfoTextItalics(this.data, {Key key}) : super(key: key);

  final String data;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: context.textTheme.bodyText1.apply(fontStyle: FontStyle.italic),
      textAlign: TextAlign.center,
    );
  }
}
