import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/controllers.dart';
import 'package:prapare/localization.dart';
import 'package:prapare/ui/styled_components/styled_components.dart';
import 'package:prapare/ui/themes.dart';
import 'package:prapare/ui/views/settings/settings_dialog.dart';

import 'group_controller.dart';
import 'group_detail.dart';
import 'header/survey_header_flexible.dart';

class GroupViewDataLoaded extends StatelessWidget {
  final double _collapsedHeight = 68.0;
  final double _expandedHeight = 200.0;

  @override
  Widget build(BuildContext context) {
    final AppTheme appTheme = Get.find<ThemeController>()
        .getAppThemeFromBrightness(context.theme.brightness);
    final labels = AppLocalizations.of(context);
    final QuestionnaireController dataController = Get.find();
    final ValidationController validationController = Get.find();
    final GroupController controller = Get.find();
    final tabList = controller.tabModel.tabList;

    return Scaffold(
      backgroundColor: appTheme.bg2,
      body: Form(
        key: validationController.formKey,

        /// NestedScrollView allows the header sliver + tabs to all use same scroll controller
        /// spec: https://api.flutter.dev/flutter/widgets/NestedScrollView-class.html
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
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
                  toolbarHeight: _collapsedHeight - 1,
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
      ),
      floatingActionButton: Obx(
        () => (validationController.validateIfRequiredGroupsAreComplete())
            ? StyledSubmitFab()
            : Container(),
      ),
      bottomNavigationBar: BottomAppBar(
        color: appTheme.bg1,
        child: Container(
          height: 60,
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // Previous
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(elevation: 0.0),
                    onPressed: controller.isTabIndexAtStart()
                        ? null
                        : () => controller.tabController.index--,
                    icon: const Icon(Icons.navigate_before),
                    label: Text(labels.navigation.previous),
                  ),
                ),
                const VerticalDivider(
                  thickness: 2.0,
                  width: 2.0,
                  color: Colors.black,
                ),
                // Next
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(elevation: 0.0),
                    onPressed: controller.isTabIndexAtEnd()
                        ? null
                        : () => controller.tabController.index++,
                    icon: const Icon(Icons.navigate_next),
                    label: Text(labels.navigation.next),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
