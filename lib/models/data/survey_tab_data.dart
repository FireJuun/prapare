import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class SurveyTab {
  SurveyTab(
      {@required this.id,
      @required this.code,
      @required this.active,
      @required this.activeChecked,
      @required this.inactive,
      @required this.inactiveChecked,
      isChecked})
      : isChecked = isChecked ?? false.obs;

  SurveyTabId id;
  String code;
  String active;
  String activeChecked;
  String inactive;
  String inactiveChecked;
  RxBool isChecked;
}

enum SurveyTabId { PERSONAL, HOME, MONEY, SOCIAL, OTHER }
