import 'package:get/instance_manager.dart';
import 'package:prapare/controllers/controllers.dart';
import 'package:prapare/ui/views/survey/group_controller.dart';

class GroupBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserResponsesController>(() => UserResponsesController());
    Get.lazyPut<ValidationController>(() => ValidationController());
    Get.lazyPut<QuestionnaireController>(() => QuestionnaireController());
    Get.lazyPut<GroupController>(() => GroupController());
  }
}
