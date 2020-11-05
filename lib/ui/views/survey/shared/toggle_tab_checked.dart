import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:prapare/models/data/survey_tab_data.dart';
import 'package:prapare/ui/views/survey/survey_controller.dart';

class ToggleTabChecked extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // todo: figure out why Get.find no longer works
    // ? due to singletickerprovider mixin?
    // final SurveyController controller = Get.find();

    return GetX<SurveyController>(
      builder: (controller) {
        /// [obj] is called within the [Obx] function. Without this, it would
        /// occasionally update an adjacent/prior tab by loading too soon

        final SurveyTab obj =
            controller.tabModel.tabList[controller.rxTabIndex];

        return Checkbox(
          value: obj.isChecked.value,
          onChanged: (value) {
            print('tabController: ${controller.tabController.index}');
            print('rxTabIndex: ${controller.rxTabIndex}');
            controller.toggleChecked(obj);
          },
        );
      },
    );
  }
}
