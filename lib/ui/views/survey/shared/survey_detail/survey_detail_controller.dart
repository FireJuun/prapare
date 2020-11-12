import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/questionnaire_controller.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

class SurveyDetailController extends GetxController {
  final QuestionnaireController data = Get.find();

  Rx<UserResponse> findUserResponseBySurvey(
      {@required Survey survey, @required int qIndex}) {
    // return response, as connected by survey code and question code
    return _personalResponses.firstWhere(
      (e) =>
          e.surveyCode == survey.code &&
          e.questionCode == survey.questions[qIndex].code,
      // Added to handle checkbox items
      // todo: clean up data model
      // e.answerCode ==
      //     survey.questions[qIndex].answers.elementAt(ansIndex).code,
      // if no response exists, create a new one
      orElse: () {
        _personalResponses.add(
          UserResponse(
            surveyCode: survey.code,
            questionCode: survey.questions[qIndex].code,
            answerCode: '',
          ),
        );
        return _personalResponses.last;
      },
    ).obs;
  }

  void setUserAnswerBySurvey(
      {@required Survey survey, @required int qIndex, @required int ansIndex}) {
    final UserResponse userResponse =
        findUserResponseBySurvey(survey: survey, qIndex: qIndex).value;
    final String surveyAnswerCode =
        survey.questions[qIndex].answers.elementAt(ansIndex).code;
    // if they're already equal, toggle answer off to ''
    userResponse.answerCode =
        (userResponse.answerCode == surveyAnswerCode) ? '' : surveyAnswerCode;

    update();
  }

  void toggleChecked(Rx<UserResponse> item) {
    item.value.answerBoolean = !item.value.answerBoolean;
    update();
  }

  final RxSet<UserResponse> _personalResponses = <UserResponse>{}.obs;
  RxSet<UserResponse> get personalResponses => _personalResponses;
  set personalResponses(Set<UserResponse> value) => _personalResponses;
}
