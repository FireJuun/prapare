import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/commands/commands.dart';
import 'package:prapare/localization.dart';

Future<bool> groupWillPopDialog(BuildContext context) async {
  showDialog<void>(
    context: context,
    builder: (BuildContext context) => _Content(),
  );
  return true;
}

class _Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);

    return AlertDialog(
      title: Text(labels.navigation.dialog.saveChanges),
      content: Text(labels.navigation.dialog.saveChangesDescription),
      actions: <Widget>[
        FlatButton(
          textColor: context.isDarkMode ? null : context.theme.errorColor,
          child: Text(labels.navigation.cancel),
          onPressed: () {
            // close dialog only
            Get.back();
          },
        ),
        const SizedBox(width: 36.0),
        _Button(
          child: Text(labels.navigation.discard),
          onPressed: () {
            // close dialog
            Get.back();

            // navigate to home, discarding changes
            Get.back();

            // show what was done
            Get.rawSnackbar(message: labels.navigation.dialog.onDiscarded);
          },
        ),
        _Button(
          child: Text(labels.navigation.save),
          onPressed: () async {
            // close dialog
            Get.back();

            // save responses
            await SaveResponsesCommand().execute();

            // navigate to home
            Get.back();

            // show what was done
            Get.rawSnackbar(message: labels.navigation.dialog.onSaved);
          },
        ),
      ],
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({Key key, @required this.onPressed, @required this.child})
      : super(key: key);
  final Widget child;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: child,
      textColor:
          context.isDarkMode ? null : context.theme.textTheme.bodyText1.color,
      onPressed: onPressed,
    );
  }
}
