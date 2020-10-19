import 'package:get/instance_manager.dart';
import 'package:prapare/controllers/questionnaire_controller.dart';
import 'package:prapare/controllers/services/fhir_service.dart';
import 'package:prapare/controllers/theme_controller.dart';
import 'package:prapare/models/fhir_model.dart';
import 'package:http/http.dart' as http;
import 'package:prapare/views/survey/survey_controller.dart';

class SurveyBinding implements Bindings {
  final FhirModel model =
      FhirModel(apiClient: FhirService(httpClient: http.Client()));

  @override
  void dependencies() {
    Get.put<QuestionnaireController>(QuestionnaireController(model: model));
    Get.put<SurveyController>(SurveyController());
    Get.lazyPut<ThemeController>(() => ThemeController());
  }
}
