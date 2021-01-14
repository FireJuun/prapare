import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:prapare/controllers/controllers.dart';
import 'package:prapare/routes/routes.dart';

import 'info_pages/export.dart';

class InfoView extends StatelessWidget {
  List<PageViewModel> _buildInfoPages() => [
        Disclaimer(),
        AboutPrapare(),
        AboutFhirFli(),
        Licenses(),
      ];

  void _navigateFromInfoView(BuildContext context) {
    final StorageController ctrl = Get.find();

    // set to false, so that this view no longer needs to show on first load
    ctrl.saveFirstLoadInfoToStore(false);

    return Navigator.of(context).canPop()
        ? Get.back()
        : Get.offAndToNamed(Routes.HOME);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: IntroductionScreen(
          showSkipButton: true,
          showNextButton: true,
          onDone: () => _navigateFromInfoView(context),
          onSkip: () => _navigateFromInfoView(context),
          next: const Text('Next'),
          skip: const Text('Skip'),
          done: const Text('Done'),
          pages: _buildInfoPages(),
        ),
      ),
    );
  }
}
