import 'package:get/instance_manager.dart';
import 'package:prapare/controllers/controllers.dart';
import 'package:prapare/ui/views/survey/group_controller.dart';

class GroupBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<UserResponsesController>(UserResponsesController());
    Get.put<QuestionnaireController>(QuestionnaireController());
    Get.put<GroupController>(GroupController());
  }
}
