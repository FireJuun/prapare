import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

abstract class InfoPage extends PageViewModel {
  InfoPage({
    @required Widget bodyWidget,
    String title,
    Widget titleWidget,
    String body,
    @required Widget image,
    Widget footer,
    PageDecoration decoration = const PageDecoration(),
  }) : super(
            title: title,
            titleWidget: titleWidget,
            body: body,
            bodyWidget: bodyWidget,
            image: image,
            footer: footer,
            decoration: decoration);
}
