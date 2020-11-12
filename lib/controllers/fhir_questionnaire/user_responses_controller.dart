import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';
import 'package:prapare/models/fhir_questionnaire/survey/response_type.dart';

class UserResponsesController extends GetxController {
  final RxList<UserResponse> _rxResponses = <UserResponse>[].obs;
  RxList<UserResponse> get rxResponses => _rxResponses;

  void updateUserResponse(UserResponse item) {
    // check for previous response by survey/question/answer
    final index = _findResponseIndex(item);

    // index of -1 means this elements wasn't found in the set
    if (index != -1) {
      _rxResponses.remove(_rxResponses.elementAt(index));
    }
    _rxResponses.add(item);
    print('All Responses:');
    _rxResponses.map((e) => print(
        's: ${e.surveyCode}  q: ${e.questionCode}  a: ${e.answerCode}  '));
    update();
  }

  void removeOldAndCreateNew(String value, UserResponse _response) {
    //todo: extract into separate command
    // if (_response != null) {
    //   removeOldUserResponse(_response);
    // }

    final newResponse = UserResponse(
      surveyCode: _response?.surveyCode,
      questionCode: _response?.questionCode,
      answerCode: value,
      responseType: ResponseBoolean(false),
    );
    updateUserResponse(newResponse);
  }

  void removeOldUserResponse(UserResponse item) {
    _rxResponses.remove(_rxResponses.firstWhere((e) => e == item));
  }

  int _findResponseIndex(UserResponse item) {
    // Get index of the set that satisfies the condition
    return _rxResponses.toList().indexWhere((e) =>
        e.surveyCode == item.surveyCode && e.questionCode == item.questionCode);
  }

  UserResponse findCheckboxResponse(
      {@required Survey survey, @required int qIndex, @required int ansIndex}) {
    final String _surveyCode = survey.code;
    final String _questionCode = survey.questions[qIndex].code;
    final String _answerCode =
        survey.questions[qIndex].answers.elementAt(ansIndex).code;

    return _rxResponses.firstWhere(
      (e) =>
          e.surveyCode == _surveyCode &&
          e.questionCode == _questionCode &&
          e.answerCode == _answerCode,
      orElse: () {
        _rxResponses.add(
          UserResponse(
            surveyCode: _surveyCode,
            questionCode: _questionCode,

            /// answer code used to match the checkbox
            /// boolean value determines if this is checked
            /// todo: ignore [false] checkbox userResponses at time of survey submission
            answerCode: _answerCode,
            responseType: ResponseBoolean(false),
          ),
        );
        return _rxResponses.last;
      },
    );
  }

  UserResponse findRadioButtonResponse(
      {@required Survey survey, @required int qIndex}) {
    return _rxResponses.firstWhere(
      (e) =>
          e.surveyCode == survey.code &&
          e.questionCode == survey.questions[qIndex].code,
      orElse: () {
        _rxResponses.add(UserResponse(
          surveyCode: survey.code,
          questionCode: survey.questions[qIndex].code,
          // blank answer code initially
          responseType: ResponseBoolean(false),
          answerCode: '',
        ));
        return _rxResponses.last;
      },
    );
  }
}
