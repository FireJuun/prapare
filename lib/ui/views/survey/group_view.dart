import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/controllers.dart';
import 'package:prapare/controllers/theme_controller.dart';
import 'package:prapare/ui/styled_components/styled_components.dart';
import 'package:prapare/ui/themes.dart';
import 'package:prapare/ui/views/settings/settings_dialog.dart';
import 'package:prapare/ui/views/survey/group_detail.dart';
import 'package:prapare/ui/views/survey/header/survey_header_flexible.dart';
import 'package:prapare/ui/views/survey/group_controller.dart';

class GroupView extends StatelessWidget {
  final double _collapsedHeight = 68.0;
  final double _expandedHeight = 200.0;

  @override
  Widget build(BuildContext context) {
    final AppTheme appTheme = Get.find<ThemeController>()
        .getAppThemeFromBrightness(context.theme.brightness);
    final QuestionnaireController dataController = Get.find();
    final GroupController controller = Get.find();
    final tabList = controller.tabModel.tabList;

    /// GestureDetector used to handle tap events to remove focus from keyboard
    /// spec: https://flutterigniter.com/dismiss-keyboard-form-lose-focus/
    /// NestedScrollView allows the header sliver + tabs to all use same scroll controller
    /// spec: https://api.flutter.dev/flutter/widgets/NestedScrollView-class.html
    return GestureDetector(
      onTap: () {
        final FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
          backgroundColor: appTheme.bg2,
          body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              // print('scrolled? $innerBoxIsScrolled');
              // These are the slivers that show up in the "outer" scroll view.
              return <Widget>[
                SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
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
              controller: controller.tabController,

              /// asMap().map()...values.toList() used to pass index w/ map
              /// spec: https://fireship.io/snippets/dart-how-to-get-the-index-on-array-loop-map/
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
                                      GroupDetail(
                                        group: dataController
                                            .getGroupFromCode(e.code),
                                      ),
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
          floatingActionButton: Obx(() =>
              (controller.validateIfRequiredSurveysComplete())
                  ? StyledSubmitFab()
                  : Container())),
    );
  }
}
