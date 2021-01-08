import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../localization.dart';

class ServicesController extends GetxController {
  static ServicesController get to => Get.find();
  final labels = AppLocalizations.of(Get.context);

  Widget _option(String text, Function function) => AlertDialog(
        title: Text(text),
        actions: [
          TextButton(
            child: Text(labels.prapare.answers.basic.no),
            onPressed: () => Get.back(),
          ),
          TextButton(
            child: Text(labels.prapare.answers.basic.yes),
            onPressed: () {
              performFunction(function);
              Get.back();
            },
          ),
        ],
      );

  Future performFunction(Function function) async {
    final name = function.toString();
    final f = name
        .substring(0, name.lastIndexOf("'"))
        .substring(name.indexOf("'") + 1);
    Get.snackbar('Function: $f', 'started');
    function().then((result) => result.fold(
          (l) => Get.snackbar('Error in $f', 'Error: ${l.errorMessage}'),
          (r) => Get.snackbar('Function: $f', 'Completed Successfully'),
        ));
    Get.back();
  }

  Widget popup(String text, Function function) => _option(text, function);
}
