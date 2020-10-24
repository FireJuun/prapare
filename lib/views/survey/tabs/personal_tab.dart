import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/strings.dart';
import 'package:prapare/views/survey/tabs/shared/personal_characteristics_questions.dart';
// maybe 'shared' isn't the right way to organize this, consider moving later
import 'package:prapare/views/survey/tabs/shared/toggle_tab_checked.dart';

//todo figure out how to fix formatting and properly use textTheme
class PersonalTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = context.textTheme;
    return ListView(
      children: [
        // Center(
        // child: Text(
        // S.TITLE_PERSONAL,
        //   style: textTheme.headline5,
        //   textAlign: TextAlign.center,
        // ),
        // ),
        PersonalCharacteristicsSurveyQuestions(),
        ToggleTabChecked(),
      ],
    );
  }
}
