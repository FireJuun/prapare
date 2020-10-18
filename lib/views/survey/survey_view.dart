import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/theme_controller.dart';
import 'package:prapare/icons.dart';
import 'package:prapare/styled_components/app_logo.dart';
import 'package:prapare/themes.dart';
import 'package:prapare/views/settings_dialog.dart';
import 'package:prapare/views/survey/tabs/home_tab.dart';
import 'package:prapare/views/survey/tabs/money_tab.dart';
import 'package:prapare/views/survey/tabs/other_tab.dart';
import 'package:prapare/views/survey/tabs/personal_tab.dart';
import 'package:prapare/views/survey/tabs/social_tab.dart';

class SurveyView extends GetWidget<ThemeController> {
  @override
  Widget build(BuildContext context) {
    final AppTheme appTheme =
        controller.getAppThemeFromBrightness(context.theme.brightness);

    return DefaultTabController(
      length: 5,
      child: Scaffold(
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
            unselectedLabelColor: appTheme.grey,
            labelColor: Colors.black,
            tabs: [
              Tab(child: SvgPicture.asset(AppIcons.PERSONAL_ICON)),
              Tab(icon: SvgPicture.asset(AppIcons.HOME_ICON)),
              Tab(icon: SvgPicture.asset(AppIcons.MONEY_ICON)),
              Tab(icon: SvgPicture.asset(AppIcons.SOCIAL_ICON)),
              Tab(icon: SvgPicture.asset(AppIcons.OTHER_ICON)),
            ],
          ),
        ),
        backgroundColor: appTheme.bg2,
        body: TabBarView(children: [
          PersonalTab(),
          HomeTab(),
          MoneyTab(),
          SocialTab(),
          OtherTab(),
        ]),
      ),
    );
  }
}
