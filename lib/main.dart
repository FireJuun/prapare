import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prapare/controllers/theme_service.dart';
import 'package:prapare/localization.dart';
import 'package:prapare/routes/routes.dart';
import 'package:prapare/ui/styled_components/styled_components.dart';
import 'package:prapare/ui/views/home/home_view.dart';

import 'controllers/controllers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initServices();
  runApp(MyApp());
}

// Theme uses GetxService so that it isn't closed during app lifecycle
Future<void> _initServices() async {
  await GetStorage.init();
  Get.put<LocaleService>(LocaleService());
  Get.put<ThemeService>(ThemeService());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeService.to.getThemeModeFromStore();
    return GetBuilder<LocaleService>(
      builder: (localeService) {
        return StyledLoading(
          child: GetMaterialApp(
            // *** LOCALES ***
            locale: localeService.getLocale, // <- Current locale
            localizationsDelegates: [
              const AppLocalizationsDelegate(), // <- Your custom delegate
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: AppLocalizations.languages.keys
                .toList(), // <- Supported locales

            // *** THEMES ***
            theme: ThemeService.to.lightTheme.themeData,
            darkTheme: ThemeService.to.darkTheme.themeData,
            themeMode: ThemeService.to.themeMode,

            // *** ROUTES ***
            // initialRoute: "/",
            home: HomeView(),
            getPages: AppPages.pages,
            debugShowCheckedModeBanner: false,
            //defaultTransition: Transition.fade,
          ),
        );
      },
    );
  }
}
