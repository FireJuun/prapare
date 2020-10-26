import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/services/theme_service.dart';
import 'package:prapare/themes.dart';
import 'package:prapare/_internal/components/custom.dart' as custom;
import 'package:prapare/views/settings/settings_dialog.dart';
import 'package:prapare/views/survey/shared/survey_detail.dart';
import 'package:prapare/views/survey/shared/survey_header_flexible.dart';
import 'package:prapare/views/survey/shared/toggle_tab_checked.dart';
import 'package:prapare/views/survey/survey_controller.dart';

class SurveyView extends StatelessWidget {
  final double _collapsedHeight = 68.0;
  final double _expandedHeight = 200.0;

  @override
  Widget build(BuildContext context) {
    final AppTheme appTheme = Get.find<ThemeService>()
        .getAppThemeFromBrightness(context.theme.brightness);
    final SurveyController surveyController = Get.find();
    final tabList = surveyController.tabModel.tabList;

    // spec: https://api.flutter.dev/flutter/widgets/NestedScrollView-class.html
    return Scaffold(
      backgroundColor: appTheme.bg2,
      body: NestedScrollView(
        // floatHeaderSlivers: true,
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
                      icon: Icon(Icons.settings),
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
                            handle:
                                NestedScrollView.sliverOverlapAbsorberHandleFor(
                                    context),
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
  }
}
