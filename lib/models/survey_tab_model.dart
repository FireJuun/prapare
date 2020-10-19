import 'package:prapare/icons.dart';
import 'package:prapare/models/data/survey_tab_data.dart';
import 'package:prapare/strings.dart';

class SurveyTabModel {
  List<SurveyTab> _tabList = [
    SurveyTab(
        id: SurveyTabId.PERSONAL,
        title: S.TITLE_PERSONAL,
        active: AppIcons.PERSONAL_ICON,
        activeChecked: AppIcons.PERSONAL_ICON_CHECKED,
        inactive: AppIcons.PERSONAL_ICON_INACTIVE,
        inactiveChecked: AppIcons.PERSONAL_ICON_INACTIVE_CHECKED),
    SurveyTab(
        id: SurveyTabId.HOME,
        title: S.TITLE_HOME,
        active: AppIcons.HOME_ICON,
        activeChecked: AppIcons.HOME_ICON_CHECKED,
        inactive: AppIcons.HOME_ICON_INACTIVE,
        inactiveChecked: AppIcons.HOME_ICON_INACTIVE_CHECKED),
    SurveyTab(
        id: SurveyTabId.MONEY,
        title: S.TITLE_MONEY,
        active: AppIcons.MONEY_ICON,
        activeChecked: AppIcons.MONEY_ICON_CHECKED,
        inactive: AppIcons.MONEY_ICON_INACTIVE,
        inactiveChecked: AppIcons.MONEY_ICON_INACTIVE_CHECKED),
    SurveyTab(
        id: SurveyTabId.SOCIAL,
        title: S.TITLE_SOCIAL,
        active: AppIcons.SOCIAL_ICON,
        activeChecked: AppIcons.SOCIAL_ICON_CHECKED,
        inactive: AppIcons.SOCIAL_ICON_INACTIVE,
        inactiveChecked: AppIcons.SOCIAL_ICON_INACTIVE_CHECKED),
    SurveyTab(
        id: SurveyTabId.OTHER,
        title: S.TITLE_OTHER,
        active: AppIcons.OTHER_ICON,
        activeChecked: AppIcons.OTHER_ICON_CHECKED,
        inactive: AppIcons.OTHER_ICON_INACTIVE,
        inactiveChecked: AppIcons.OTHER_ICON_INACTIVE_CHECKED),
  ];
  List<SurveyTab> get tabList => this._tabList;
  set tabList(List<SurveyTab> value) => this._tabList;
}
