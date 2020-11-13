import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:prapare/controllers/controllers.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

// todo: this needs to be called before all surveys, and hold all data
// it cannot be passed as multiples / inherited widget
class QuestionItemController extends GetxController {
  final QuestionnaireController _questionnaireController = Get.find();
  final UserResponsesController _responsesController = Get.find();

  /// contains a list of all relevant responses
  /// surveyList, <questionSet, <answerSet, <userResponse>>>
  // final RxList<List<Set<UserResponse>>> _qUserResponses = [
  //   [<UserResponse>{}]
  // ].obs;

  /// contains the active response for a given question
  /// RxList used instead of RxSet, as this can have duplicates
  /// One example is the presence of blank UserResponse() items created onInit
  /// surveyList, <questionList, <userResponse for the answer>>
  final RxList<List<UserResponse>> _activeResponse = [<UserResponse>[]].obs;

  // UserResponse findActiveResponse(
  //     {@required Survey survey,
  //     @required Question question,
  //     @required Answer answer}) {
  //   // flatten all responses into single list to query
  //   final List<UserResponse> _allResponses =
  //       _activeResponse.expand((e) => e).toList();
  //   // find response by code.
  //   // this can be optimized to its own util
  //   // todo: implement orElse
  //   return _allResponses.firstWhere(
  //       (response) =>
  //           response.surveyCode == survey.code &&
  //           response.questionCode == question.code &&
  //           response.answerCode == answer.code,
  //       orElse: () => UserResponse());
  // }

  // List<UserResponse>

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
    // if (newResponse == null) {
    //   oldResponse.responseType.value = false;
    //   _activeResponse[sIndex][qIndex] = UserResponse();
    // } else {
    //   // find all responses in the set and turn off their booleans
    //   _qUserResponses
    //       .elementAt(sIndex)
    //       .elementAt(qIndex)
    //       .forEach((e) => e.responseType.value = false);

    //   // then toggle this boolean
    //   newResponse.responseType.value = true;
    //   // set active response field
    //   _activeResponse[sIndex][qIndex] = newResponse;
    // }

    update();
  }

  // UserResponse getActiveRadioButtonFromIndex(
  //         {@required int sIndex, @required int qIndex}) =>
  //     _qUserResponses.elementAt(sIndex).elementAt(qIndex).firstWhere(
  //         (e) => e.responseType.value,
  //         orElse: () => UserResponse());

  // ******* INITIALIZERS *******
  // void _loadAllUserResponseOptions() {
  //   _qUserResponses.clear();
  //   // question set has unique questions w/in a survey
  //   final List<Set<UserResponse>> _questionList = [];

  //   // create a new List item for each question
  //   _questionnaireController.getQuestionnaire().surveys.forEach((survey) {
  //     survey.questions.forEach(
  //       (quest) {
  //         // answer set contains each relevant UserResponse
  //         final Set<UserResponse> _answerSet = quest.answers
  //             .map((ans) => _responsesController.findUserResponse(
  //                 surveyCode: survey.code,
  //                 questionCode: quest.code,
  //                 answerCode: ans.code))
  //             .toSet();
  //         _questionList.add(_answerSet);
  //       },
  //     );
  //     // create a new list item for qUserResponses holding the survey data

  //     // add this survey to the RxList
  //     _qUserResponses.add(_questionList);
  //     // then reset _questionList for next iterable
  //     _questionList.clear();
  //   });
  // }

  // @override
  // void onInit() {
  //   _loadAllUserResponseOptions();
  //   super.onInit();
  // }
}
