import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/utils/unfocuser.dart';
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

    /// GestureDetector workaround replace w/ Unfocuser

    return Unfocuser(
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
