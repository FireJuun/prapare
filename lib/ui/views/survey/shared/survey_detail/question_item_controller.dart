import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:prapare/controllers/controllers.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';
import 'package:prapare/models/fhir_questionnaire/survey/response_type.dart';

// todo: this needs to be called before all surveys, and hold all data
// it cannot be passed as multiples / inherited widget
class QuestionItemController extends GetxController {
  final QuestionnaireController _questionnaireController = Get.find();
  final UserResponsesController _responsesController = Get.find();

  // todo: extract
  void toggleCheckboxCommand(
      {@required UserResponse userResponse, bool newValue}) {
    userResponse.responseType.value =
        newValue ?? !userResponse.responseType.value;
    update();
  }

  //todo: extract
  void toggleRadioButtonCommand({
    @required UserResponse oldResponse,
    @required UserResponse newResponse,
  }) {
    // if toggled to off state
    if (newResponse == null) {
      // set this boolean to false
      oldResponse.responseType.value = false;

      // and reset the active UserResponse
      _responsesController.rxMappedActiveResponses[oldResponse.questionCode] =
          UserResponse(
        surveyCode: oldResponse.surveyCode,
        questionCode: oldResponse.questionCode,
        answerCode: '',
        responseType: ResponseBoolean(false),
      );
      // _activeResponse[sIndex][qIndex] = UserResponse();
    } else {
      // find all responses in the set and turn off their booleans
      _responsesController
          .setAllQuestionBooleansToFalse(oldResponse.questionCode);

      // then toggle this boolean
      newResponse.responseType.value = true;
      // set active response field
      _responsesController.rxMappedActiveResponses[oldResponse.questionCode] =
          newResponse;
    }

    update();
  }
}
