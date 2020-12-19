import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:prapare/ui/icons.dart';

class InfoImage extends StatelessWidget {
  const InfoImage({Key key, this.svgAsset = AppIcons.INFO_CLINICAL_TRIAL_ICON})
      : super(key: key);

  final String svgAsset;

  @override
  Widget build(BuildContext context) {
    return Center(child: SvgPicture.asset(svgAsset, width: Get.width / 2));
  }
}
