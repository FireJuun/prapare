import 'package:fhir/r4.dart';
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

  int getTotalIndexFromQuestion(String questionLinkId) =>
      _allQuestions.indexWhere((e) => e.linkId == questionLinkId);

  void _mapAllQuestions() {
    _allQuestions = _model.data.survey.surveyItems
        .map((e) => (e as ItemGroup).surveyItems)
        .expand((x) => x)
        .toList();
  }

  void _mapAllUserResponses() => _model.data.survey.surveyItems.forEach(
        (s) => s.runtimeType == ItemGroup ? _mapGroup(s) : _mapQuestion(s),
      );

  void _mapGroup(ItemGroup itemGroup) => itemGroup.surveyItems.forEach((item) =>
      item.runtimeType == ItemGroup ? _mapGroup(item) : _mapQuestion(item));

  void _mapQuestion(Question question) {
    switch (question.itemType) {
      case QuestionnaireItemType.choice:
        question.answers.forEach(
            (answer) => _addQuestion(question.linkId, AnswerCode(answer.code)));
        break;
      case QuestionnaireItemType.open_choice:
        question.answers.forEach(
            (answer) => _addQuestion(question.linkId, AnswerCode(answer.code)));
        break;
      case QuestionnaireItemType.boolean:
        _addQuestion(question.linkId, AnswerBoolean(false));
        break;
      case QuestionnaireItemType.decimal:
        _addQuestion(question.linkId, AnswerDecimal(0));
        break;
      case QuestionnaireItemType.integer:
        _addQuestion(question.linkId, AnswerInteger(0));
        break;
      case QuestionnaireItemType.string:
        _addQuestion(question.linkId, AnswerString(''));
        break;
      case QuestionnaireItemType.text:
        _addQuestion(question.linkId, AnswerText(''));
        break;
      default:
        _addQuestion(question.linkId, AnswerText(''));
        break;
    }
  }

  void _addQuestion(String linkId, AnswerResponse answer) =>
      _responsesController.rxResponses
          .add(UserResponse(questionLinkId: linkId, answers: [answer]).obs);

  void _mapAllActiveResponses() {
    /// defaults to blank answer on first load
    /// afterwards, the new UserResponse will be updated to reflect the selected item
    /// then ResponseBoolean will be selected to true for that item
    /// todo: ignore question types that aren't radio-buttons
    _model.data.survey.surveyItems.forEach(
      (e) {
        if (e is ItemGroup) {
          // If surveyItem (abstract) is of type ItemGroup, map each of the itemGroup's surveyItems
          final ItemGroup itemGroup = e;
          itemGroup.surveyItems.forEach(
            (q) {
              if (q is Question) {
                _responsesController.rxMappedActiveResponses.add(
                  q.linkId,
                  UserResponse(
                      questionLinkId: q.linkId,
                      answers: [AnswerBoolean(false)]).obs,
                );
              }
            },
          );
        }
      },
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
