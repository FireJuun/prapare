import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/strings.dart';
import 'package:prapare/views/survey/tabs/shared/lorem_ipsum.dart';
import 'package:prapare/views/survey/tabs/shared/toggle_tab_checked.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = context.textTheme;
    return ListView(
      children: [
        Center(
          child: Text(
            S.TITLE_HOME,
            style: textTheme.headline5,
            textAlign: TextAlign.center,
          ),
        ),
        ToggleTabChecked(),
        LoremIpsum(),
      ],
    );
  }
}
