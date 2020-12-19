import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'info_pages/export.dart';

class InfoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: IntroductionScreen(
          showSkipButton: true,
          showNextButton: true,
          onDone: () => Get.back(),
          onSkip: () => Get.back(),
          next: const Text('Next'),
          skip: const Text('Skip'),
          done: const Text('Done'),
          pages: _buildInfoPages(),
        ),
      ),
    );
  }
}

List<PageViewModel> _buildInfoPages() => [
      Disclaimer(),
      AboutPrapare(),
      AboutFhirFli(),
      Licenses(),
    ];
