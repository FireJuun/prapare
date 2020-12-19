import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:prapare/ui/icons.dart';

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

Widget _svg(String asset) =>
    Center(child: SvgPicture.asset(asset, width: Get.width / 2));

List<PageViewModel> _buildInfoPages() => [
      PageViewModel(
        title: 'Disclaimer',
        image: _svg(AppIcons.INFO_CLINICAL_TRIAL_ICON),
        bodyWidget: Center(
          child: ListView(
            shrinkWrap: true,
            children: const [
              Text('''This app is designed for demo use only.
In its current form, IT IS NOT INTENDED FOR CLINICAL USE.'''),
              Text(
                  'If you are interested in using this app in a clinical setting, please go to:'),
              Text('mayjuun.com/portfolio/prapare-survey/'),
              Text('We can chat.'),
            ],
          ),
        ),
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
