import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/views/survey.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE4E4E3),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 48.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _appLogo(),
              _buttonLarge(
                  title: 'New Survey', onPressed: () => Get.to(Survey())),
              _buttonLarge(title: 'Edit Survey'),
              _buttonLarge(title: 'Submit/Share'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _appLogo() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Image(
        image: AssetImage('assets/images/PRAPARE-Logo-with-tagline.png'),
      ),
    );
  }

  Widget _buttonLarge({@required String title, Function onPressed}) {
    return FlatButton(
      child: SizedBox(
        width: 300,
        height: 100,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 280,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: (onPressed != null)
                      ? Color(0xFF689E80)
                      : Color(0xFFB5B5B5),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: 280,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: (onPressed != null)
                      ? Color(0xFFE1994C)
                      : Color(0xFFE4E4E3),
                ),
                child: Center(
                    child: Text(
                  title,
                  style: TextStyle(fontSize: 36),
                )),
              ),
            ),
          ],
        ),
      ),
      onPressed: onPressed,
    );
  }
}
