import 'package:get/route_manager.dart';
import 'package:prapare/ui/views/home/home_view.dart';
import 'package:prapare/ui/views/survey/group_binding.dart';
import 'package:prapare/ui/views/survey/group_view.dart';

part 'app_routes.dart';

mixin AppPages {
  static final pages = [
    GetPage(name: Routes.HOME, page: () => HomeView()),
    GetPage(
      name: Routes.GROUP,
      page: () => GroupView(),
      binding: GroupBinding(),
    ),
  ];
}
