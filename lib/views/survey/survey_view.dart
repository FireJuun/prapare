import 'package:flutter/material.dart';
// hide TextTheme;
// above "hide" command is necessary to resolve the error "Error: 'TextTheme' is imported from both 'package:flutter/src/material/text_theme.dart' and 'package:prapare/themes.dart'."
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

    return GetX<SurveyController>(
      builder: (surveyController) {
        final tabList = surveyController.tabModel.tabList;
        return Scaffold(
          backgroundColor: appTheme.bg2,
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                title: AppLogoNoTagline(),
                snap: true,
                floating: true,
                pinned: true,
                actions: [
                  IconButton(
                      icon: Icon(Icons.settings),
                      onPressed: () => settingsDialog())
                ],
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
                      (index) => Tab(
                        icon: SvgPicture.asset(
                            surveyController.getTabIconFromIndex(
                                index, surveyController.rxTabIndex)),
                      ),
                    )
                  ],
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                    child: PreferredSize(
                  preferredSize: Size.fromHeight(80.0),
                  child: SizedBox(
                    /// This box also persists under the SliverAppBar widget
                    /// Using Align and Padding to get around that,
                    /// though there's probably a more elegant way
                    height: 100.0,
                    width: double.infinity,
                    child: Obx(
                      () => Container(
                        color: surveyController.getTabBackgroundColorFromIndex(
                            surveyController.rxTabIndex, appTheme),
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: Text(
                                tabList[surveyController.rxTabIndex].title,
                                style: context.theme.accentTextTheme.headline5,
                                textAlign: TextAlign.center,
                              ),
                            )),
                      ),
                    ),
                  ),
                )),
              ),
              SliverFillRemaining(
                child: TabBarView(
                  controller: surveyController.tabController,
                  children: [
                    PersonalTab(),
                    HomeTab(),
                    MoneyTab(),
                    SocialTab(),
                    OtherTab(),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final PreferredSize child;

  _SliverAppBarDelegate({this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => child.preferredSize.height;

  @override
  double get minExtent => child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
