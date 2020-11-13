import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:prapare/controllers/controllers.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

class QuestionItemController extends GetxController {
  QuestionItemController({@required this.survey}) : assert(survey != null);

  // Passed variables
  final Survey survey;

  final UserResponsesController _responsesController = Get.find();

  final RxSet<RxSet<UserResponse>> _qUserResponses = {<UserResponse>{}.obs}.obs;
  RxSet<RxSet<UserResponse>> get qUserResponses => _qUserResponses;

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
    print('done');
  }

  @override
  void onInit() {
    _loadAllUserResponseOptionsForSurvey();
    super.onInit();
  }
}
