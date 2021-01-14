import 'package:prapare/ui/icons.dart';
import 'package:prapare/models/survey_tab/survey_tab_data.dart';
import 'package:prapare/ui/strings.dart';

class SurveyTabModel {
  final List<SurveyTab> _tabList = [
    SurveyTab(
        id: SurveyTabId.PERSONAL,
        code: S.CODE_PERSONAL,
        active: AppIcons.PERSONAL_ICON,
        activeChecked: AppIcons.PERSONAL_ICON_CHECKED,
        inactive: AppIcons.PERSONAL_ICON_INACTIVE,
        inactiveChecked: AppIcons.PERSONAL_ICON_INACTIVE_CHECKED),
    SurveyTab(
        id: SurveyTabId.HOME,
        code: S.CODE_HOME,
        active: AppIcons.HOME_ICON,
        activeChecked: AppIcons.HOME_ICON_CHECKED,
        inactive: AppIcons.HOME_ICON_INACTIVE,
        inactiveChecked: AppIcons.HOME_ICON_INACTIVE_CHECKED),
    SurveyTab(
        id: SurveyTabId.MONEY,
        code: S.CODE_MONEY,
        active: AppIcons.MONEY_ICON,
        activeChecked: AppIcons.MONEY_ICON_CHECKED,
        inactive: AppIcons.MONEY_ICON_INACTIVE,
        inactiveChecked: AppIcons.MONEY_ICON_INACTIVE_CHECKED),
    SurveyTab(
        id: SurveyTabId.SOCIAL,
        code: S.CODE_SOCIAL,
        active: AppIcons.SOCIAL_ICON,
        activeChecked: AppIcons.SOCIAL_ICON_CHECKED,
        inactive: AppIcons.SOCIAL_ICON_INACTIVE,
        inactiveChecked: AppIcons.SOCIAL_ICON_INACTIVE_CHECKED),
    SurveyTab(
        id: SurveyTabId.OTHER,
        code: S.CODE_OTHER,
        active: AppIcons.OTHER_ICON,
        activeChecked: AppIcons.OTHER_ICON_CHECKED,
        inactive: AppIcons.OTHER_ICON_INACTIVE,
        inactiveChecked: AppIcons.OTHER_ICON_INACTIVE_CHECKED),
  ];
  List<SurveyTab> get tabList => _tabList;
  set tabList(List<SurveyTab> value) => _tabList;
}
