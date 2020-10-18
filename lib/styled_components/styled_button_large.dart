import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StyledButtonLarge extends StatelessWidget {
  final String title;
  final Function onPressed;

  StyledButtonLarge({@required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
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
                      ? context.theme.colorScheme.primary
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
                      ? context.theme.colorScheme.secondary
                      : context.theme.backgroundColor,
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
