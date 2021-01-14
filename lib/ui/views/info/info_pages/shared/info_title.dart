import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoTitle extends StatelessWidget {
  const InfoTitle(this.data, {Key key}) : super(key: key);

  final String data;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: context.textTheme.headline4,
      textAlign: TextAlign.center,
    );
  }
}
