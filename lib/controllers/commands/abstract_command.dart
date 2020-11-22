import 'package:get/get.dart';
import 'package:prapare/controllers/controllers.dart';
import 'package:prapare/ui/views/survey/group_controller.dart';

abstract class AbstractCommand {
  final QuestionnaireController questionnaireController = Get.find();
  final UserResponsesController responsesController = Get.find();
  final GroupController groupController = Get.find();
  final ValidationController validationController = Get.find();
}
