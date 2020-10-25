import 'package:get/instance_manager.dart';
import 'package:prapare/controllers/questionnaire_controller.dart';
import 'package:prapare/views/survey/survey_controller.dart';

class SurveyBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SurveyController>(SurveyController());
    Get.put<QuestionnaireController>(QuestionnaireController());
  }
}
