import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/styled_components/app_logo.dart';
import 'package:prapare/styled_components/styled_button_large.dart';
import 'package:prapare/views/survey.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFE4E4E3),
      // appBar: AppBar(
      //   title: Text('PRAPARE'),
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 48.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppLogo(),
              StyledButtonLarge(
                  title: 'New Survey', onPressed: () => Get.to(Survey())),
              StyledButtonLarge(title: 'Edit Survey'),
              StyledButtonLarge(title: 'Submit/Share'),
            ],
          ),
        ),
      ),
    );
  }
}
