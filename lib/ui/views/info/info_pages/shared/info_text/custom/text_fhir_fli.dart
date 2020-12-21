import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/controllers.dart';

import '../export.dart';

class TextFhirFli extends StatelessWidget {
  const TextFhirFli({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Ctrl>(
      init: Ctrl(),
      initState: (_) {},
      builder: (_) {
        return GestureDetector(
          onTap: () => _.handleTap(),
          child: const InfoText(
              'Fast Healthcare Interoperability Resources (FHIR)\n...with Flutter Library Integration (FLI)'),
        );
      },
    );
  }
}

class Ctrl extends GetxController {
  int lastTap = DateTime.now().millisecondsSinceEpoch;
  int consecutiveTaps = 0;

  void handleTap() {
    // https://stackoverflow.com/questions/59625936/flutter-detect-triple-tap
    final int now = DateTime.now().millisecondsSinceEpoch;
    if (now - lastTap < 900) {
      consecutiveTaps++;
      if (consecutiveTaps >= 6) {
        final StorageController ctrl = Get.find();
        ctrl.saveFirstLoadInfoToStore(true);
        Get.rawSnackbar(message: 'Well done!');
        Get.dialog(_Egg());
      } else if (consecutiveTaps >= 4 && consecutiveTaps <= 6) {
        Get.rawSnackbar(message: '${7 - consecutiveTaps} tap(s) to go...');
      }
    } else {
      consecutiveTaps = 0;
    }
    lastTap = now;
  }
}

class _Egg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/fhir-fli-logo.png', fit: BoxFit.contain),
          Image.asset('assets/images/mayjuun_bg_dark.png', fit: BoxFit.contain)
        ],
      ),
    );
  }
}
