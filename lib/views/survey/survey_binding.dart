import 'package:get/instance_manager.dart';
import 'package:prapare/models/survey_model.dart';
import 'package:prapare/views/survey/survey_controller.dart';

class SurveyBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SurveyController>(SurveyController());
    Get.put<SurveyModel>(SurveyModel());
  }
}
