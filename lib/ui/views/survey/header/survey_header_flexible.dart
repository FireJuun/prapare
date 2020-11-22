// import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:prapare/_internal/components/custom.dart' as custom;
import 'package:prapare/_internal/utils/prapare_codes_util.dart';
import 'package:prapare/controllers/theme_controller.dart';
import 'package:prapare/localization.dart';
import 'package:prapare/ui/styled_components/app_logo.dart';
import 'package:prapare/ui/themes.dart';
import 'package:prapare/ui/views/survey/group_controller.dart';

// spec: https://stackoverflow.com/questions/63231817/custom-flexiblespacebar-widget

class SurveyHeaderFlexible extends StatelessWidget {
  final double _tabHeight = 72.0;

  @override
  Widget build(BuildContext context) {
    final AppTheme appTheme = Get.find<ThemeController>()
        .getAppThemeFromBrightness(context.theme.brightness);
    final GroupController groupController = Get.find();
    final tabList = groupController.tabModel.tabList;
    final codesUtil = PrapareCodesUtil();
    final labels = AppLocalizations.of(context);

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        /// Decides opacity at the start/end of scroll
        // todo: extract to animation controller, add animation effects
        final settings = context
            .dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();
        final bool isExpanded = settings.currentExtent == settings.maxExtent;
        // final deltaExtent = settings.maxExtent - settings.minExtent;
        // final t =
        //     (1.0 - (settings.currentExtent - settings.minExtent) / deltaExtent)
        //         .clamp(0.0, 1.0) as double;
        // final fadeStart = math.max(0.0, 1.0 - kToolbarHeight / deltaExtent);
        // const fadeEnd = 1.0;

        // Opacity, or tween, for use by animation controller
        // final tween = 1.0 - Interval(fadeStart, fadeEnd).transform(t);

        PreferredSizeWidget _tabBar() => PreferredSize(
              /// Preferred size used to match custom tab heights
              /// Otherwise, render errors occur when scrolling up
              preferredSize: Size.fromHeight(_tabHeight),
              child: TabBar(
                labelPadding:
                    const EdgeInsets.symmetric(horizontal: 2.0, vertical: 0.0),
                controller: groupController.tabController,
                unselectedLabelColor: appTheme.grey,
                labelColor: Colors.black,
                tabs: [
                  /// spread operator used for more concise code
                  /// obx and rxTabIndex used to trigger redraw on data change
                  /// function passes index of tabList, which is used by
                  /// the controller to get the same tabList item
                  ...List.generate(
                    tabList.length,
                    (index) => custom.Tab(
                      // using custom TabBar to set height as a workaround
                      // issue: https://github.com/flutter/flutter/issues/13322
                      icon: Obx(
                        () => SvgPicture.asset(
                            groupController.getTabIconFromIndex(
                                index, groupController.rxTabIndex),
                            height: _tabHeight),
                      ),
                    ),
                  )
                ],
              ),
            );
        Widget _subHeader() => Flexible(
              child: Obx(
                () => Container(
                  height: 70,
                  color: groupController.getTabBackgroundColorFromIndex(
                      groupController.rxTabIndex, appTheme),
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: Center(
                    child: Text(
                      codesUtil.getTitleFromLinkIdAndLocale(
                          tabList[groupController.rxTabIndex].code, labels),
                      style: isExpanded
                          ? context.theme.accentTextTheme.headline5
                          : context.theme.accentTextTheme.headline6,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            );

        Widget _buildExpanded() => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppLogoNoTagline(),
                ),
                _tabBar(),
                _subHeader(),
              ],
            );

        Widget _buildCollapsed() => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(children: [
                Obx(() => SvgPicture.asset(
                    groupController.getTabIconFromIndex(
                        groupController.rxTabIndex, groupController.rxTabIndex),
                    height: _tabHeight)),
                _subHeader(),
              ]),
            );

        // Checks to see if it's fully expanded, else draws collapsed
        return SafeArea(
          child: SizedBox(
            height: settings.currentExtent,
            child: isExpanded ? _buildExpanded() : _buildCollapsed(),
          ),
        );
      },
    );
  }
}
