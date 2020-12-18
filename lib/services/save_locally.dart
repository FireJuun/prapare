import 'dart:io';

import 'package:get_storage/get_storage.dart';

Future saveLocally(String bundle) async {
  final path = (await getExternalStorageDirectory()).path;
  final file = File('$path/questionnaireBundle.txt');
  file.writeAsString(bundle);
}
