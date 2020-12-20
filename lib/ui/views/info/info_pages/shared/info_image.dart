import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class InfoImage extends StatelessWidget {
  const InfoImage(this.svgAsset, {Key key}) : super(key: key);

  final String svgAsset;

  @override
  Widget build(BuildContext context) {
    return Center(child: SvgPicture.asset(svgAsset, width: Get.width / 1.3));
  }
}
