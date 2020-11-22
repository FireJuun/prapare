import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StyledButtonLarge extends StatelessWidget {
  const StyledButtonLarge({@required this.title, this.onPressed});

  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;

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
                      : const Color(0xFFB5B5B5),
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
                  style: textTheme.headline4,
                  textAlign: TextAlign.center,
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
