import 'package:get/state_manager.dart';
import 'package:prapare/_internal/constants/prapare_survey.dart';
import 'package:prapare/models/data/survey/question.dart';
import 'package:prapare/models/data/survey/survey.dart';
import 'package:prapare/models/questionnaire_model.dart';

class QuestionnaireController extends GetxController {
  /// A semi-temporary data model, which will be transitioned to harness [prapareSurvey]
  /// For now, the data points have been created manually, and the codes don't quite correlate yet

  final QuestionnaireModel _model = QuestionnaireModel();
  List<Question> _allQuestions;

  //todo: implement error handling / orElse
  Survey getSurveyFromCode(String code) => _model.data.surveys
      .firstWhere((e) => e.code == code, orElse: () => Survey());

  int getTotalIndexFromQuestion(Question question) =>
      _allQuestions.indexOf(question);

  void _mapAllQuestions() => _allQuestions =
      _model.data.surveys.map((e) => e.questions).expand((x) => x).toList();

  @override
  void onInit() {
    _model.loadAndCreateSurvey();
    _mapAllQuestions();
    super.onInit();
  }
}
