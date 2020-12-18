import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

class InfoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: IntroductionScreen(
          onDone: () => Get.back(),
          done: const Text('Done'),
          pages: _buildInfoPages(),
        ),
      ),
    );
  }
}

List<PageViewModel> _buildInfoPages() => [
      PageViewModel(
        title: 'Title of first page',
        body:
            'Here you can write the description of the page, to explain someting...',
      ),
      PageViewModel(
        title: 'Title of second page',
        body:
            'Here you can write the description of the page, to explain someting...',
      ),
      PageViewModel(
        title: 'Title of third page',
        body:
            'Here you can write the description of the page, to explain someting...',
      ),
    ];
