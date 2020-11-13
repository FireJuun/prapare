import 'package:get/instance_manager.dart';
import 'package:prapare/controllers/controllers.dart';
import 'package:prapare/ui/views/survey/shared/survey_detail/question_item_controller.dart';
import 'package:prapare/ui/views/survey/survey_controller.dart';

class SurveyBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SurveyController>(SurveyController());
    Get.put<UserResponsesController>(UserResponsesController());
    Get.put<QuestionnaireController>(QuestionnaireController());
    Get.put<QuestionItemController>(QuestionItemController());
  }
}
