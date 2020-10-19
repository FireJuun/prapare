import 'package:flutter/foundation.dart';

class SurveyTab {
  SurveyTabId id;
  String active;
  String activeChecked;
  String inactive;
  String inactiveChecked;
  bool isChecked;

  SurveyTab(
      {@required this.id,
      @required this.active,
      @required this.activeChecked,
      @required this.inactive,
      @required this.inactiveChecked,
      this.isChecked = false});
}

enum SurveyTabId { PERSONAL, HOME, MONEY, SOCIAL, OTHER }
