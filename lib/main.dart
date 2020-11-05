import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/theme_service.dart';
import 'package:prapare/routes/routes.dart';
import 'package:prapare/ui/views/home/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initServices();
  runApp(MyApp());
}

// Theme uses GetxService so that it isn't closed during app lifecycle
Future<void> _initServices() async {
  await Get.putAsync<ThemeService>(() => ThemeService().init());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomeView(),
      getPages: AppPages.pages,
      theme: ThemeService.to.lightTheme.themeData,
      darkTheme: ThemeService.to.darkTheme.themeData,
      themeMode: ThemeService.to.themeMode,
    );
  }
}
