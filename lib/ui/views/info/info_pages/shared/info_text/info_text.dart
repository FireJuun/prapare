import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoText extends StatelessWidget {
  const InfoText(this.data, {Key key}) : super(key: key);

  final String data;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: context.textTheme.headline6,
      textAlign: TextAlign.center,
    );
  }
}
