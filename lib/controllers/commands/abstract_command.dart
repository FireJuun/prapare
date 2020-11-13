import 'package:get/get.dart';
import 'package:prapare/controllers/controllers.dart';

abstract class AbstractCommand {
  final QuestionnaireController questionnaireController = Get.find();
  final UserResponsesController responsesController = Get.find();
}
