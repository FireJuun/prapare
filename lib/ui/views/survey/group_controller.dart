import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/models/survey_tab/survey_tab_data.dart';
import 'package:prapare/models/survey_tab/survey_tab_model.dart';
import 'package:prapare/ui/themes.dart';

class GroupController extends GetxController with SingleGetTickerProviderMixin {
  TabController _tabController;
  TabController get tabController => _tabController;

  // Used to decide which tab is active, as determined by the tab controller
  final RxInt _rxTabIndex = 0.obs;
  set rxTabIndex(value) => _rxTabIndex.value = value;
  int get rxTabIndex => _rxTabIndex.value;

  final SurveyTabModel tabModel = SurveyTabModel();

  String getTabIconFromIndex(int index, int ctrlIndex) {
    final SurveyTab obj = tabModel.tabList[index];
    if (index == ctrlIndex) {
      return (obj.isChecked.value) ? obj.activeChecked : obj.active;
    } else
      return (obj.isChecked.value) ? obj.inactiveChecked : obj.inactive;
  }

  Color getTabBackgroundColorFromIndex(int index, AppTheme appTheme) {
    switch (index) {
      case 0:
        return appTheme.heading1;
      case 1:
        return appTheme.heading2;
      case 2:
        return appTheme.heading3;
      case 3:
        return appTheme.heading4;
      case 4:
        return appTheme.heading5;
      default:
        return appTheme.heading1;
    }
  }

  bool isTabIndexAtStart() => (_rxTabIndex.value == 0) ? true : false;
  bool isTabIndexAtEnd() =>
      (_rxTabIndex.value == _tabController.length - 1) ? true : false;

  @override
  void onInit() {
    _tabController = TabController(
        initialIndex: _rxTabIndex.value,
        length: tabModel.tabList.length,
        vsync: this)
      ..addListener(() => _rxTabIndex.value = _tabController.index);
    super.onInit();
  }

  @override
  void onClose() {
    _tabController.dispose();
    super.onClose();
  }
}
