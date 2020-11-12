import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/theme_controller.dart';
import 'package:prapare/ui/themes.dart';
import 'package:prapare/ui/views/settings/settings_dialog.dart';
import 'package:prapare/ui/views/survey/shared/survey_detail/survey_detail.dart';
import 'package:prapare/ui/views/survey/shared/survey_header_flexible.dart';
import 'package:prapare/ui/views/survey/shared/toggle_tab_checked.dart';
import 'package:prapare/ui/views/survey/survey_controller.dart';

class SurveyView extends StatelessWidget {
  final double _collapsedHeight = 68.0;
  final double _expandedHeight = 200.0;

  @override
  Widget build(BuildContext context) {
    final AppTheme appTheme = Get.find<ThemeController>()
        .getAppThemeFromBrightness(context.theme.brightness);
    final SurveyController surveyController = Get.find();
    final tabList = surveyController.tabModel.tabList;

    // spec: https://api.flutter.dev/flutter/widgets/NestedScrollView-class.html
    return Scaffold(
      backgroundColor: appTheme.bg2,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          // print('scrolled? $innerBoxIsScrolled');
          // These are the slivers that show up in the "outer" scroll view.
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                excludeHeaderSemantics: true,
                forceElevated: innerBoxIsScrolled,
                pinned: true,
                floating: true,
                snap: true,
                actions: [
                  IconButton(
                      icon: const Icon(Icons.settings),
                      onPressed: () => settingsDialog())
                ],
                expandedHeight: _expandedHeight,
                collapsedHeight: _collapsedHeight,
                flexibleSpace: SurveyHeaderFlexible(),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: surveyController.tabController,

          /// asMap().map()...values.toList() used to pass index w/ map
          /// spec: https://fireship.io/snippets/dart-how-to-get-the-index-on-array-loop-map/
          children: tabList
              .asMap()
              .map(
                (i, e) => MapEntry(
                    i,
                    SafeArea(
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
                                      SurveyDetail(
                                          tabIndex: i, surveyCode: e.code),
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
                    )),
              )
              .values
              .toList(),
        ),
      ),
    );
  }
}
