import 'package:get/state_manager.dart';
import 'package:prapare/_internal/constants/prapare_survey.dart';
import 'package:prapare/models/data/survey/question.dart';
import 'package:prapare/models/data/survey/survey.dart';
import 'package:prapare/models/questionnaire_model.dart';

class QuestionnaireController extends GetxController {
  // static QuestionnaireController get to => Get.find();

  /// A semi-temporary data model, which will be transitioned to harness [prapareSurvey]
  /// For now, the data points have been created manually, and the codes don't quite correlate yet

  QuestionnaireModel _model = QuestionnaireModel();

  //todo: implement error handling / orElse
  Survey getSurveyFromCode(String code) => _model.data.surveys
      .firstWhere((e) => e.code == code, orElse: () => Survey());

  int getTotalIndexFromQuestion(Question question) {
    List<Question> tempQuestionList = [
      ..._model.data.surveys.map((e) => e.questions).expand((x) => x)
    ];

    // todo: implement error handling / duplicates handling
    return tempQuestionList.indexOf(question);
  }

  @override
  void onInit() {
    _model.loadAndCreateSurvey();
    super.onInit();
  }
}
