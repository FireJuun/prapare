import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoTextBold extends StatelessWidget {
  const InfoTextBold(this.data, {Key key}) : super(key: key);

  final String data;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: context.textTheme.bodyText1.apply(fontWeightDelta: 5),
      textAlign: TextAlign.center,
    );
  }
}
