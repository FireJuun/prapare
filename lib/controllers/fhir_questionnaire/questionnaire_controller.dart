import 'package:fhir/r4.dart';
import 'package:get/get.dart';
import 'package:prapare/_internal/constants/prapare_survey.dart';
import 'package:prapare/_internal/utils/utils.dart';
import 'package:prapare/controllers/controllers.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';
import 'package:prapare/models/fhir_questionnaire/questionnaire_model.dart';

class QuestionnaireController extends GetxController {
  /// A semi-temporary data model, which will be transitioned to harness [prapareSurvey]
  /// For now, the data points have been created manually, and the codes don't quite correlate yet

  final QuestionnaireModel _model = QuestionnaireModel();

  final UserResponsesController _responsesController = Get.find();
  final ValidationController _validationController = Get.find();

  RxBool isDataLoaded = false.obs;

  // *******************************************************************
  // ******************* GETTERS AND SETTERS ***************************
  // *******************************************************************
  // used to find the index / question number
  final List<SurveyItem> _allQuestionsList = [];
  // used to find the unique question based on questionId link
  final Map<String, Question> _allQuestionsMap = {};

  ItemGroup getGroupFromCode(String code) => _model.data.survey.surveyItems
      .firstWhere((e) => e.linkId == code, orElse: () => ItemGroup());

  ItemGroup getGroupFromIndex(int sIndex) =>
      _model.data.survey.surveyItems[sIndex];

  int getGroupIndexFromGroup(ItemGroup itemGroup) =>
      _model.data.survey.surveyItems.indexWhere((e) => e == itemGroup);

  /// This is a convenience method to quickly retrieve question info from _allQuestions
  Question getQuestionFromUserResponse(Rx<UserResponse> userResponse) {
    final questionLinkId = userResponse.value.questionLinkId;
    final groupAndQuestionId =
        LinkIdUtil().getGroupAndQuestionId(questionLinkId);
    try {
      return _allQuestionsMap[groupAndQuestionId] ??
          _allQuestionsMap[questionLinkId];
    } catch (error) {
      return error.message;
    }
  }

  int getTotalIndexFromQuestion(String questionLinkId) =>
      _allQuestionsList.indexWhere((e) => e.linkId == questionLinkId);

  Future<void> saveResponse(List<UserResponse> responses) async =>
      await _model.saveResponses(responses);

  // *******************************************************************
  // ******** MAPPING FUNCTIONS, ON FIRST LOAD OF QUESTIONNAIRE ********
  // *******************************************************************
  Future<bool> _mapAllQuestions() async {
    // _allQuestionsMap handled separately, with userResponsesMap
    await _buildAllQuestionsList();
    await _buildAllQuestionsValidators();
    return true;
  }

  // each index number denotes a new question, which will have its own collapsable title
  Future<bool> _buildAllQuestionsList() async {
    _model.data.survey.surveyItems.forEach(
      (e) => (e as ItemGroup).surveyItems.forEach(
            (survItem) => _allQuestionsList.add(survItem),
          ),
    );
    return true;
  }

  /// Each Question or ItemGroup, as numbered from the original
  /// survey.surveyItem list, will keep state of its own validator
  /// Its overall linkId is defined as '/groupId/questionId'
  // todo: if loading a old / partially completed survey, will need to determine QuestionValidators() data as well
  Future<bool> _buildAllQuestionsValidators() async {
    _allQuestionsList.forEach((e) => _addQuestionValidator(e.linkId));
    return true;
  }

  void _addQuestionValidator(String linkId) =>
      _validationController.questionValidatorsMap[linkId] =
          QuestionValidators();

  Future<bool> _mapQuestionEnableWhenValidators(SurveyItem surveyItem) async {
    if (surveyItem is Question) {
      if (surveyItem.questionEnableWhen != null) {
        surveyItem.questionEnableWhen.forEach(
          (qEnableWhen) => _addQuestionEnableWhenValidator(qEnableWhen),
        );
      }
    }
    return true;
  }

  void _addQuestionEnableWhenValidator(QuestionEnableWhen qEnableWhen) =>
      _validationController.questionEnableWhenValidatorsMap[qEnableWhen] =
          false.obs;

  /// Maps based on: ItemGroup vs Question

  Future<bool> _mapAllUserResponses() async {
    _model.data.survey.surveyItems.forEach(
      (s) => s.runtimeType == ItemGroup ? _mapGroup(s) : _mapQuestion(s),
    );
    return true;
  }

  void _mapGroup(ItemGroup itemGroup) => itemGroup.surveyItems.forEach((item) =>
      item.runtimeType == ItemGroup ? _mapGroup(item) : _mapQuestion(item));

  void _mapQuestion(Question question) {
    _mapQuestionEnableWhenValidators(question);

    switch (question.itemType) {
      // If present in a UserResponse list, the Choice is true. If absent, it is false
      case QuestionnaireItemType.choice:
        question.answers.forEach((answer) => _addQuestionToMapAndToUserResponse(
            question, AnswerCode(answer.code)));
        break;

      // Open Choice stores the value as a string. The code is what links it to the item
      case QuestionnaireItemType.open_choice:
        question.answers.forEach((answer) => _addQuestionToMapAndToUserResponse(
            question, AnswerOther(answer.code, '')));
        break;

      /// For now, I'm setting the default boolean UserResponse to null
      /// It is possible to have 3-phase boolean responses (true / false / null), which we want to handle
      case QuestionnaireItemType.boolean:
        _addQuestionToMapAndToUserResponse(
            question, AnswerBoolean(question.linkId, null));
        break;

      /// NOTE Decimals and Integers can have a null value if no data are set
      /// otherwise a textediting controller will default to 0 or 0.0 in the data field
      case QuestionnaireItemType.decimal:
        _addQuestionToMapAndToUserResponse(question, AnswerDecimal(null));
        break;
      case QuestionnaireItemType.integer:
        _addQuestionToMapAndToUserResponse(question, AnswerInteger(null));
        break;

      /// Strings are easier to handle, simply defaulting to ''
      case QuestionnaireItemType.string:
        _addQuestionToMapAndToUserResponse(question, AnswerString(''));
        break;
      case QuestionnaireItemType.text:
        _addQuestionToMapAndToUserResponse(question, AnswerText(''));
        break;

      // todo: handle datetimes and other item types
      default:
        _addQuestionToMapAndToUserResponse(question, AnswerText(''));
        break;
    }
    if (question.subQuestions.isNotEmpty) {
      question.subQuestions.forEach((e) => _mapSubQuestion(e));
    }
  }

  void _mapSubQuestion(Question subQuestion) => _mapQuestion(subQuestion);

  void _addQuestionToMapAndToUserResponse(
      Question question, AnswerResponse answer) {
    final linkId = question.linkId;
    // convenience function for finding all questions
    _allQuestionsMap[linkId] = question;
    // blank answerResponse added to UserResponse map, if not already present
    // todo: this appears to be duplicate to _mapAllActiveResponses
    _responsesController.userResponsesMap[linkId] ??=
        UserResponse(questionLinkId: linkId, answers: <AnswerResponse>[]).obs;
  }

  Future<bool> _mapAllActiveResponses() async {
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
                    UserResponseUtil().createBlankUserResponseByQuestionType(q);
              }
            },
          );
        }
      },
    );
    return true;
  }

  // create empty validators with false as default
  Future<bool> _mapAllGroupValidators() async {
    _model.data.survey.surveyItems.forEach(
        (s) => _validationController.groupValidatorsMap[s.linkId] = false.obs);
    return true;
  }

  Future<bool> createAndMapAllData() async {
    isDataLoaded.value = false;
    await _model.loadAndCreateSurvey();
    await _mapAllQuestions();
    await _mapAllUserResponses();
    await _mapAllActiveResponses();
    await _mapAllGroupValidators();
    return isDataLoaded.value = true;
  }

  @override
  Future<void> onInit() async {
    await createAndMapAllData();
    super.onInit();
  }
}
