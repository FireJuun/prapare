import 'package:get/get.dart';
import 'package:prapare/controllers/controllers.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

class SurveyDetailController extends GetxController {
  final QuestionnaireController data = Get.find();

  // todo: extract into standalone ToggleCheckboxCommand
  void toggleChecked(UserResponse item) {
    item.responseType.value = !item.responseType.value;
    update();
  }
}
