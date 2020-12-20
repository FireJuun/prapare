import 'package:flutter/material.dart';
import 'package:prapare/services/launch_url.dart';

class LaunchUrlCommand {
  Future<void> execute({@required String url}) async => await launchUrl(url);
}
