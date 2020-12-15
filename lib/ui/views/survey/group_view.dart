import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/controllers.dart';
import 'package:prapare/controllers/theme_controller.dart';
import 'package:prapare/ui/themes.dart';

import 'group_view_data_loaded.dart';

class GroupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final QuestionnaireController dataController = Get.find();
    final AppTheme appTheme = Get.find<ThemeController>()
        .getAppThemeFromBrightness(context.theme.brightness);

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
      child: Obx(
        () => dataController.isDataLoaded.value
            ? GroupViewDataLoaded()
            : Scaffold(
                appBar: AppBar(toolbarHeight: 0),
                backgroundColor: appTheme.bg2,
                body: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
      ),
    );
  }
}
