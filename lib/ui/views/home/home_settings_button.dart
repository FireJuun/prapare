import 'package:flutter/material.dart';
import 'package:prapare/ui/views/settings/settings_dialog.dart';

class HomeSettingsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Align(
        alignment: AlignmentDirectional.centerEnd,
        child: IconButton(
          icon: const Icon(Icons.settings, size: 36),
          onPressed: () => settingsDialog(context),
        ),
      ),
    );
  }
}
