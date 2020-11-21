import 'package:get/get.dart';
import 'package:prapare/_internal/constants/prapare_survey.dart';
import 'package:prapare/controllers/controllers.dart';
import 'package:prapare/models/fhir_questionnaire/fhir_questionnaire.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';
import 'package:prapare/models/fhir_questionnaire/questionnaire_model.dart';

class QuestionnaireController extends GetxController {
  /// A semi-temporary data model, which will be transitioned to harness [prapareSurvey]
  /// For now, the data points have been created manually, and the codes don't quite correlate yet

  final QuestionnaireModel _model = QuestionnaireModel();

  final UserResponsesController _responsesController = Get.find();
  List<SurveyItem> _allQuestions;

  //todo: implement error handling / orElse
  ItemGroup getGroupFromCode(String code) => _model.data.survey.surveyItems
      .firstWhere((e) => e.linkId == code, orElse: () => ItemGroup());

  //todo: implement error handling / orElse
  ItemGroup getSurveyFromIndex(int sIndex) =>
      _model.data.survey.surveyItems[sIndex];

  //todo: implement error handling / orElse
  int getSurveyIndexFromSurvey(ItemGroup itemGroup) =>
      _model.data.survey.surveyItems.indexWhere((e) => e == itemGroup);

  FhirQuestionnaire getQuestionnaire() => _model.data;

  int getTotalIndexFromQuestion(Question question) =>
      _allQuestions.indexOf(question);

  void _mapAllQuestions() {
    _allQuestions = _model.data.survey.surveyItems
        .map((e) => (e as ItemGroup).surveyItems)
        .expand((x) => x)
        .toList();
  }

  void _mapAllUserResponses() {
    _model.data.survey.surveyItems.forEach(
      (s) => (s as ItemGroup).surveyItems.forEach(
            (q) => (q as Question).answers.forEach(
                  (ans) => _responsesController.rxResponses.add(
                    // if AnswerType.choice ==> use booleans, otherwise strings
                    // todo: update with various additional response types
                    (ans.code == 'decimal' || ans.code == 'string')
                        ? UserResponse(
                            questionLinkId: q.linkId,
                            answers: [AnswerCode(ans.code)]).obs
                        : UserResponse(
                            questionLinkId: q.linkId,
                            answers: [AnswerBoolean(false)]).obs,
                  ),
                ),
          ),
    );
  }

  void _mapAllActiveResponses() {
    /// defaults to blank answer on first load
    /// afterwards, the new UserResponse will be updated to reflect the selected item
    /// then ResponseBoolean will be selected to true for that item
    /// todo: ignore question types that aren't radio-buttons
    _model.data.survey.surveyItems.forEach(
      (s) => (s as ItemGroup).surveyItems.forEach(
            (q) => _responsesController.rxMappedActiveResponses.add(
              (q as Question).linkId,
              UserResponse(
                  questionLinkId: q.linkId,
                  answers: [AnswerBoolean(false)]).obs,
            ),
          ),
    );
  }

  @override
  void onInit() {
    _model.loadAndCreateSurvey();
    _mapAllQuestions();
    _mapAllUserResponses();
    _mapAllActiveResponses();
    super.onInit();
  }
}
