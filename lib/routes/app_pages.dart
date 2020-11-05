import 'package:get/route_manager.dart';
import 'package:prapare/ui/views/home/home_view.dart';
import 'package:prapare/ui/views/survey/survey_binding.dart';
import 'package:prapare/ui/views/survey/survey_view.dart';

part 'app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.HOME, page: () => HomeView()),
    GetPage(
      name: Routes.SURVEY,
      page: () => SurveyView(),
      binding: SurveyBinding(),
    ),
  ];
}
