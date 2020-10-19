import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/theme_controller.dart';
import 'package:prapare/routes/app_pages.dart';
import 'package:prapare/views/home/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initServices();
  runApp(MyApp());
}

// Theme uses GetxService so that it isn't closed during app lifecycle
Future<void> _initServices() async {
  await Get.putAsync<ThemeController>(() => ThemeController().init());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomeView(),
      getPages: AppPages.pages,
      theme: ThemeController.to.lightTheme.themeData,
      darkTheme: ThemeController.to.darkTheme.themeData,
      themeMode: ThemeController.to.themeMode,
    );
  }
}
