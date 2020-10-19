import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/services/theme_service.dart';
import 'package:prapare/styled_components/app_logo.dart';
import 'package:prapare/themes.dart';
import 'package:prapare/views/settings/settings_dialog.dart';
import 'package:prapare/views/survey/survey_controller.dart';
import 'package:prapare/views/survey/tabs/home_tab.dart';
import 'package:prapare/views/survey/tabs/money_tab.dart';
import 'package:prapare/views/survey/tabs/other_tab.dart';
import 'package:prapare/views/survey/tabs/personal_tab.dart';
import 'package:prapare/views/survey/tabs/social_tab.dart';

class SurveyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppTheme appTheme = Get.find<ThemeService>()
        .getAppThemeFromBrightness(context.theme.brightness);
    final SurveyController surveyController = Get.find();
    final tabList = surveyController.tabModel.tabList;

    return Scaffold(
      appBar: AppBar(
        // brightness: Brightness.dark,
        // backgroundColor: Colors.transparent,
        // iconTheme: Get.theme.iconTheme.copyWith(color: Colors.black),
        elevation: 0,
        title: AppLogoNoTagline(),
        titleSpacing: 0,
        actions: [
          IconButton(
              icon: Icon(Icons.settings), onPressed: () => settingsDialog())
        ],
        // remove this line to include back navigation button
        // automaticallyImplyLeading: false,
        bottom: TabBar(
          controller: surveyController.tabController,
          unselectedLabelColor: appTheme.grey,
          labelColor: Colors.black,
          tabs: [
            /// spread operator used for more concise code
            /// obx and rxTabIndex used to trigger redraw on data change
            /// function passes index of tabList, which is used by
            /// the controller to get the same tabList item
            ...List.generate(
              tabList.length,
              (index) => Obx(
                () => Tab(
                  icon: SvgPicture.asset(surveyController.getTabIconFromIndex(
                      index, surveyController.rxTabIndex)),
                ),
              ),
            )
          ],
        ),
      ),
      backgroundColor: appTheme.bg2,
      body: TabBarView(controller: surveyController.tabController, children: [
        PersonalTab(),
        HomeTab(),
        MoneyTab(),
        SocialTab(),
        OtherTab(),
      ]),
    );
  }
}
