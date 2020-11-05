import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:prapare/models/data/survey_tab_data.dart';
import 'package:prapare/models/survey_tab_model.dart';
import 'package:prapare/ui/themes.dart';

class SurveyController extends GetxController
    with SingleGetTickerProviderMixin {
  TabController _tabController;
  get tabController => this._tabController;

  final _rxTabIndex = 0.obs;
  set rxTabIndex(value) => this._rxTabIndex.value = value;
  get rxTabIndex => this._rxTabIndex.value;

  final SurveyTabModel tabModel = SurveyTabModel();

  void toggleChecked(SurveyTab obj) =>
      obj.isChecked.value = !obj.isChecked.value;

  String getTabIconFromIndex(int index, int ctrlIndex) {
    SurveyTab obj = tabModel.tabList[index];
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
