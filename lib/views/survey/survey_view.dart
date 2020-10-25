import 'package:flutter/material.dart';
// hide TextTheme;
// above "hide" command is necessary to resolve the error "Error: 'TextTheme' is imported from both 'package:flutter/src/material/text_theme.dart' and 'package:prapare/themes.dart'."
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/services/theme_service.dart';
import 'package:prapare/themes.dart';
import 'package:prapare/_internal/components/custom.dart' as custom;
import 'package:prapare/views/survey/shared/survey_detail.dart';
import 'package:prapare/views/survey/shared/toggle_tab_checked.dart';
import 'package:prapare/views/survey/survey_controller.dart';

class SurveyView extends StatelessWidget {
  // final double _maxExpandedTabHeight = 120.0;
  final double _tabHeight = 72.0;

  @override
  Widget build(BuildContext context) {
    final AppTheme appTheme = Get.find<ThemeService>()
        .getAppThemeFromBrightness(context.theme.brightness);

    // spec: https://api.flutter.dev/flutter/widgets/NestedScrollView-class.html
    return GetX<SurveyController>(
      builder: (surveyController) {
        final tabList = surveyController.tabModel.tabList;
        final rxTabIndex = surveyController.rxTabIndex;

        return Scaffold(
          backgroundColor: appTheme.bg2,
          body: NestedScrollView(
            // floatHeaderSlivers: true,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              // These are the slivers that show up in the "outer" scroll view.
              return <Widget>[
                SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverAppBar(
                    excludeHeaderSemantics: true,
                    title: Text('PRAPARE: ${tabList[rxTabIndex].title}'),
                    pinned: true,
                    floating: true,
                    snap: true,
                    forceElevated: innerBoxIsScrolled,
                    bottom: PreferredSize(
                      /// Preferred size used to match custom tab heights
                      /// Otherwise, render errors occur when scrolling up
                      preferredSize: Size.fromHeight(_tabHeight),
                      child: TabBar(
                        labelPadding: EdgeInsets.symmetric(
                            horizontal: 2.0, vertical: 0.0),
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
                            (index) => custom.Tab(
                              // using custom TabBar to set height as a workaround
                              // issue: https://github.com/flutter/flutter/issues/13322
                              icon: Obx(
                                () => SvgPicture.asset(
                                    surveyController.getTabIconFromIndex(
                                        index, surveyController.rxTabIndex),
                                    height: _tabHeight),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    // todo: implement custom header
                    // Text(
                    //   tabList[surveyController.rxTabIndex].title,
                    //   style: context.theme.accentTextTheme.headline5,
                    //   textAlign: TextAlign.center,
                    // ),
                  ),
                ),
              ];
            },
            body: TabBarView(
              controller: surveyController.tabController,
              children: tabList
                  .map(
                    (e) => SafeArea(
                      top: false,
                      bottom: false,
                      child: Builder(
                        builder: (BuildContext context) {
                          return CustomScrollView(
                            key: PageStorageKey<String>(e.id.toString()),
                            slivers: <Widget>[
                              SliverOverlapInjector(
                                handle: NestedScrollView
                                    .sliverOverlapAbsorberHandleFor(context),
                              ),
                              SliverPadding(
                                padding: const EdgeInsets.all(8.0),
                                sliver: SliverList(
                                  delegate: SliverChildListDelegate(
                                    [
                                      SurveyDetail(surveyCode: e.code),
                                      // todo: implement check for when all data fields have data, then remove [ToggleTabChecked]
                                      ToggleTabChecked(),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}
