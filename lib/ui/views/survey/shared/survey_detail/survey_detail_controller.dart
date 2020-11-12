import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:prapare/models/data/survey/question.dart';
import 'package:prapare/models/data/survey/survey.dart';
import 'package:prapare/models/data/survey/user_response.dart';
import 'package:prapare/controllers/questionnaire_controller.dart';

class SurveyDetailController extends GetxController {
  final QuestionnaireController data = Get.find();

  Rx<UserResponse> findUserResponseBySurvey(
      {@required Survey survey, @required int qIndex}) {
    // return response, as connected by survey code and question code
    return _personalResponses.firstWhere(
      (e) =>
          e.surveyCode == survey.code &&
          e.questionCode == survey.questions[qIndex].code,
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

  final RxSet<UserResponse> _personalResponses = <UserResponse>{}.obs;
  RxSet<UserResponse> get personalResponses => _personalResponses;
  set personalResponses(Set<UserResponse> value) => _personalResponses;
}
