import 'package:flutter/material.dart';

// spec: https://github.com/delay/flutter_starter
// Model class to hold menu option data (language and theme)
class MenuOption {
  MenuOption(
      {@required this.key,
      @required this.value,
      @required this.englishValue,
      this.icon});

  String key;
  String value;
  String englishValue;
  IconData icon;
}
