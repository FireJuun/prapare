import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:prapare/controllers/controllers.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

class QuestionItemController extends GetxController {
  QuestionItemController({@required this.survey, @required this.qIndex})
      : assert(survey != null),
        assert(qIndex != null);

  // Passed variables
  final Survey survey;
  final int qIndex;

  UserResponsesController responsesController = Get.find();
  final RxSet<UserResponse> _qUserResponses = <UserResponse>{}.obs;

  void _loadAllUserResponseOptionsForQuestion() {
    _qUserResponses.clear();
    responsesController.rxResponses.forEach(
      (e) {
        // check to see if the set item matches this survey / question
        // if so, add them to this controller
        if (e.surveyCode == survey.code &&
            e.questionCode == survey.questions[qIndex].code) {
          _qUserResponses.add(e);
        }
      },
    );

    @override
    void onInit() {
      _loadAllUserResponseOptionsForQuestion();
      super.onInit();
    }
  }
}
