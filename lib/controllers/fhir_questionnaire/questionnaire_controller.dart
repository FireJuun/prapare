import 'package:fhir/r4.dart';
import 'package:get/get.dart';
import 'package:prapare/_internal/constants/prapare_survey.dart';
import 'package:prapare/controllers/controllers.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';
import 'package:prapare/models/fhir_questionnaire/questionnaire_model.dart';

class QuestionnaireController extends GetxController {
  /// A semi-temporary data model, which will be transitioned to harness [prapareSurvey]
  /// For now, the data points have been created manually, and the codes don't quite correlate yet

  final QuestionnaireModel _model = QuestionnaireModel();

  final UserResponsesController _responsesController = Get.find();
  final ValidationController _validationController = Get.find();

  // *******************************************************************
  // ******************* GETTERS AND SETTERS ***************************
  // *******************************************************************
  List<SurveyItem> _allQuestions;

  ItemGroup getGroupFromCode(String code) => _model.data.survey.surveyItems
      .firstWhere((e) => e.linkId == code, orElse: () => ItemGroup());

  ItemGroup getGroupFromIndex(int sIndex) =>
      _model.data.survey.surveyItems[sIndex];

  int getGroupIndexFromGroup(ItemGroup itemGroup) =>
      _model.data.survey.surveyItems.indexWhere((e) => e == itemGroup);

  /// This is a convenience method to quickly retrieve question info from _allQuestions
  Question getQuestionFromLinkId(String questionLinkId) =>
      _allQuestions.firstWhere((e) => e.linkId == questionLinkId);

  int getTotalIndexFromQuestion(String questionLinkId) =>
      _allQuestions.indexWhere((e) => e.linkId == questionLinkId);

  Future saveResponse(List<UserResponse> responses) async =>
      await _model.saveResponses(responses);

  // *******************************************************************
  // ******** MAPPING FUNCTIONS, ON FIRST LOAD OF QUESTIONNAIRE ********
  // *******************************************************************
  void _mapAllQuestions() {
    _allQuestions = _model.data.survey.surveyItems
        .map((e) => (e as ItemGroup).surveyItems)
        .expand((x) => x)
        .toList();

    _mapAllQuestionValidators(_allQuestions);
  }

  /// Each Question or ItemGroup, as numbered from the original
  /// survey.surveyItem list, will keep state of its own validator
  /// Its overall linkId is defined as '/groupId/questionId'
  // todo: if loading a old / partially completed survey, will need to determine QuestionValidators() data as well
  void _mapAllQuestionValidators(List<SurveyItem> allQuestions) =>
      allQuestions.forEach((e) => _addQuestionValidator(e.linkId));

  void _addQuestionValidator(String linkId) =>
      _validationController.questionValidatorsMap[linkId] =
          QuestionValidators();

  void _mapQuestionEnableWhenValidators(SurveyItem surveyItem) {
    if (surveyItem is Question) {
      if (surveyItem.questionEnableWhen != null) {
        surveyItem.questionEnableWhen.forEach(
          (qEnableWhen) => _addQuestionEnableWhenValidator(qEnableWhen),
        );
      }
    }
  }

  void _addQuestionEnableWhenValidator(QuestionEnableWhen qEnableWhen) =>
      _validationController.questionEnableWhenValidatorsMap[qEnableWhen] =
          false.obs;

  void _mapAllUserResponses() => _model.data.survey.surveyItems.forEach(
        (s) => s.runtimeType == ItemGroup ? _mapGroup(s) : _mapQuestion(s),
      );

  void _mapGroup(ItemGroup itemGroup) => itemGroup.surveyItems.forEach((item) =>
      item.runtimeType == ItemGroup ? _mapGroup(item) : _mapQuestion(item));

  void _mapQuestion(Question question) {
    _mapQuestionEnableWhenValidators(question);

    switch (question.itemType) {
      // If present in a UserResponse list, the Choice is true. If absent, it is false
      case QuestionnaireItemType.choice:
        question.answers.forEach(
            (answer) => _addQuestion(question.linkId, AnswerCode(answer.code)));
        break;

      // Open Choice stores the value as a string. The code is what links it to the item
      case QuestionnaireItemType.open_choice:
        question.answers.forEach((answer) =>
            _addQuestion(question.linkId, AnswerOther(answer.code, '')));
        break;

      /// For now, I'm setting the default boolean UserResponse to null
      /// It is possible to have 3-phase boolean responses (true / false / null), which we want to handle
      case QuestionnaireItemType.boolean:
        _addQuestion(question.linkId, AnswerBoolean(question.linkId, null));
        break;

      /// NOTE Decimals and Integers can have a null value if no data are set
      /// otherwise a textediting controller will default to 0 or 0.0 in the data field
      case QuestionnaireItemType.decimal:
        _addQuestion(question.linkId, AnswerDecimal(null));
        break;
      case QuestionnaireItemType.integer:
        _addQuestion(question.linkId, AnswerInteger(null));
        break;

      /// Strings are easier to handle, simply defaulting to ''
      case QuestionnaireItemType.string:
        _addQuestion(question.linkId, AnswerString(''));
        break;
      case QuestionnaireItemType.text:
        _addQuestion(question.linkId, AnswerText(''));
        break;

      // todo: handle datetimes and other item types
      default:
        _addQuestion(question.linkId, AnswerText(''));
        break;
    }
    if (question.subQuestions.isNotEmpty) {
      question.subQuestions.forEach((e) => _mapSubQuestion(e));
    }
  }

  void _mapSubQuestion(Question subQuestion) => _mapQuestion(subQuestion);

  void _addQuestion(String linkId, AnswerResponse answer) =>
      _responsesController.userResponsesMap[linkId] =
          UserResponse(questionLinkId: linkId, answers: [answer]).obs;

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
                // create a blank User Response, which will have the active answers mapped into it
                _responsesController.userResponsesMap[q.linkId] =
                    _handleBlankUserResponseByQuestionType(q);
              }
            },
          );
        }
      },
    );
  }

  Rx<UserResponse> _handleBlankUserResponseByQuestionType(Question q) {
    switch (q.itemType) {

      /// Choice and Open-Choice use the AnswerList to provide all positive values
      /// All negative/false values are removed from this list
      /// Thus, these questions begin with a blank list
      case QuestionnaireItemType.choice:
      case QuestionnaireItemType.open_choice:
        return UserResponse(questionLinkId: q.linkId, answers: []).obs;

      /// For now, I'm setting the default boolean UserResponse to null
      /// It is possible to have 3-phase boolean responses (true / false / null), which we want to handle
      case QuestionnaireItemType.boolean:
        return UserResponse(
            questionLinkId: q.linkId,
            answers: [AnswerBoolean(q.linkId, null)]).obs;

      /// Decimals / Integers handled similarly to Question Mapping above, w/ default nulls
      case QuestionnaireItemType.decimal:
        return UserResponse(
            questionLinkId: q.linkId, answers: [AnswerDecimal(null)]).obs;
      case QuestionnaireItemType.integer:
        return UserResponse(
            questionLinkId: q.linkId, answers: [AnswerInteger(null)]).obs;

      /// Strings / text handled similarly to Question Mapping above, w/ default ''
      case QuestionnaireItemType.string:
        return UserResponse(
            questionLinkId: q.linkId, answers: [AnswerString('')]).obs;
      case QuestionnaireItemType.text:
        return UserResponse(questionLinkId: q.linkId, answers: [AnswerText('')])
            .obs;

      // todo: handle datetimes and other item types
      default:
        return UserResponse(
            questionLinkId: q.linkId, answers: [AnswerString('')]).obs;
    }
  }

  // create empty validators with false as default
  void _mapAllGroupValidators() {
    _model.data.survey.surveyItems.forEach(
        (s) => _validationController.groupValidatorsMap[s.linkId] = false.obs);
  }

  @override
  void onInit() {
    _model.loadAndCreateSurvey();
    _mapAllQuestions();
    _mapAllUserResponses();
    _mapAllActiveResponses();
    _mapAllGroupValidators();
    super.onInit();
  }
}
