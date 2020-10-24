import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:prapare/models/data/survey/answer.dart';
import 'package:prapare/models/data/survey/question.dart';
import 'package:prapare/models/data/survey/survey.dart';
import 'package:prapare/models/data/survey/user_response.dart';
import 'package:prapare/views/survey/tabs/shared/personal_characteristics_data.dart';

class PersonalCharacteristicsController extends GetxController {
  final PersonalCharacteristicsData data = PersonalCharacteristicsData();

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
    UserResponse userResponse =
        findUserResponseBySurvey(survey: survey, qIndex: qIndex).value;
    String surveyAnswerCode =
        survey.questions[qIndex].answers.elementAt(ansIndex).code;
    // if they're already equal, toggle answer off to ''
    userResponse.answerCode =
        (userResponse.answerCode == surveyAnswerCode) ? '' : surveyAnswerCode;

    update();
  }

  Survey _personalSurvey = Survey(
    code: 'personal',
    title: 'PRAPARE',
    text: 'Personal Characteristics',
    questions: [
      Question(
        code: 'q1',
        text: 'Are you Hispanic or Latino?',
        answers: _createBasicYesNoList(),
        format: QFormat.radio,
      ),
    ],
  );
  Survey get personalSurvey => this._personalSurvey;
  set personalSurvey(Survey value) => this._personalSurvey;

  RxSet<UserResponse> _personalResponses = <UserResponse>{}.obs;
  RxSet<UserResponse> get personalResponses => this._personalResponses;
  set personalResponses(Set<UserResponse> value) => this._personalResponses;
}

Set<Answer> _createBasicYesNoList() => {
      Answer(code: 'Y', text: 'Yes'),
      Answer(code: 'N', text: 'No'),
      Answer(code: 'X', text: 'I choose not to answer this question'),
    };
