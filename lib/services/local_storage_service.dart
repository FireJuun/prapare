import 'dart:io';

import 'package:get_storage/get_storage.dart';

class LocalStorage {
  Future saveBundle(String bundle) async {
    final path = (await getApplicationDocumentsDirectory()).path;
    final file = File('$path/questionnaireBundle.txt');
    file.writeAsString(bundle);
  }
}
