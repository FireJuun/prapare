import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/controllers.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';
import 'package:prapare/models/survey_tab/survey_tab_data.dart';
import 'package:prapare/models/survey_tab/survey_tab_model.dart';
import 'package:prapare/ui/themes.dart';

class SurveyController extends GetxController
    with SingleGetTickerProviderMixin {
  final QuestionnaireController _questionnaireController = Get.find();
  final UserResponsesController _responsesController = Get.find();

  TabController _tabController;
  TabController get tabController => _tabController;

  // Used to decide which tab is active, as determined by the tab controller
  final RxInt _rxTabIndex = 0.obs;
  set rxTabIndex(value) => _rxTabIndex.value = value;
  int get rxTabIndex => _rxTabIndex.value;

  final SurveyTabModel tabModel = SurveyTabModel();

  // holds state of which tabs are checked, mapped by survey code
  final RxMap<String, RxBool> _rxMappedValidatedTabs = <String, RxBool>{}.obs;
  RxMap<String, RxBool> get rxMappedValidatedTabs => _rxMappedValidatedTabs;

  bool validateIfSurveyIsCompleted(String surveyCode) {
    final Survey survey =
        _questionnaireController.getSurveyFromCode(surveyCode);
    // for each question in this survey...
    return survey.questions.every((q) {
      // check to see if the mapped active response has a boolean of true

      // blank radiobuttons have '' answer codes and false values
      // checkboxes will have true values, ?? in active response
      // todo: implement means to verify at least one checkbox is active
      final activeResponses =
          _responsesController.rxMappedActiveResponses[q.code];

      // todo: figure out if this is also this necessary
      // activeResponses.value.answerCode != '' &&
      if (activeResponses.value.responseType.value == true) {
        // get relevant SurveyTab, and toggle it as checked
        tabModel.tabList
            .firstWhere((e) => e.code == survey.code)
            .isChecked
            .value = true;
        return true;
      } else {
        tabModel.tabList
            .firstWhere((e) => e.code == survey.code)
            .isChecked
            .value = false;
        return false;
      }
    });
  }

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

  void _mapAllSurveyValidators() {
    _questionnaireController
        .getQuestionnaire()
        .surveys
        .forEach((s) => _rxMappedValidatedTabs.add(s.code, false.obs));
  }

  @override
  void onInit() {
    _tabController = TabController(
        initialIndex: _rxTabIndex.value,
        length: tabModel.tabList.length,
        vsync: this)
      ..addListener(() => _rxTabIndex.value = _tabController.index);
    _mapAllSurveyValidators();
    super.onInit();
  }

  @override
  void onClose() {
    _tabController.dispose();
    super.onClose();
  }
}
