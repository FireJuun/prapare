import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:prapare/controllers/controllers.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

// todo: this needs to be called before all surveys, and hold all data
// it cannot be passed as multiples / inherited widget
class QuestionItemController extends GetxController {
  QuestionItemController({@required this.survey}) : assert(survey != null);

  // Passed variables
  final Survey survey;

  final UserResponsesController _responsesController = Get.find();

  // contains a list of all relevant responses
  final RxSet<RxSet<UserResponse>> _qUserResponses = {<UserResponse>{}.obs}.obs;
  RxSet<RxSet<UserResponse>> get qUserResponses => _qUserResponses;

  /// contains the active response for a given question
  /// RxList used instead of RxSet, as this can have duplicates
  /// One example si the presence of blank UserResponse() items created onInit
  final RxList<UserResponse> _activeResponse = <UserResponse>[].obs;
  RxList<UserResponse> get activeResponse => _activeResponse;

  // todo: extract
  void toggleCheckboxCommand(
      {@required UserResponse userResponse, bool newValue}) {
    userResponse.responseType.value =
        newValue ?? !userResponse.responseType.value;
    update();
  }

  //todo: extract
  void toggleRadioButtonCommand(
      {@required UserResponse oldResponse,
      @required UserResponse newResponse,
      @required int qIndex}) {
    // if toggled to off state
    if (newResponse == null) {
      oldResponse.responseType.value = false;
      _activeResponse[qIndex] = UserResponse();
    } else {
      // find all responses in the set and turn off their booleans
      _qUserResponses
          .elementAt(qIndex)
          .forEach((e) => e.responseType.value = false);

      // then toggle this boolean
      newResponse.responseType.value = true;
      // set active response field
      _activeResponse[qIndex] = newResponse;
    }

    update();
  }

  UserResponse getActiveRadioButtonFromQuestionIndex(int qIndex) =>
      _qUserResponses.elementAt(qIndex).firstWhere((e) => e.responseType.value,
          orElse: () => UserResponse());

  // ******* INITIALIZERS *******
  void _loadAllUserResponseOptionsForSurvey() {
    _qUserResponses.clear();
    // create a new RxSet item for each question
    survey.questions.forEach(
      (quest) {
        // answer items each contain the relevant UserResponse
        final RxSet<UserResponse> _items = quest.answers
            .map((ans) => _responsesController.findUserResponse(
                surveyCode: survey.code,
                questionCode: quest.code,
                answerCode: ans.code))
            .toSet()
            .obs;
        _qUserResponses.add(_items);
      },
    );
  }

  void _loadActiveResponses() {
    // clear responses from last tab
    _activeResponse.clear();

    // add responses to new tab
    survey.questions.forEach(
      (q) => _activeResponse.add(
        // todo: check UserResponses for last active if question is radio button
        // ! otherwise, this will be blank everytime you swap tabs
        UserResponse(),
      ),
    );
  }

  @override
  void onInit() {
    _loadAllUserResponseOptionsForSurvey();
    _loadActiveResponses();
    super.onInit();
  }
}
