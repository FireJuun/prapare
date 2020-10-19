import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:prapare/models/data/survey_tab_data.dart';
import 'package:prapare/views/survey/survey_controller.dart';

class ToggleTabChecked extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SurveyController controller = Get.find();
    final SurveyTab obj = controller.tabModel.tabList[controller.rxTabIndex];
    return Obx(
      () => Checkbox(
        value: obj.isChecked.value,
        onChanged: (value) {
          //todo: this sometimes checks the wrong tab
          print('tabController: ${controller.tabController.index}');
          print('rxTabIndex: ${controller.rxTabIndex}');
          controller.toggleChecked(obj);
        },
      ),
    );
  }
}
