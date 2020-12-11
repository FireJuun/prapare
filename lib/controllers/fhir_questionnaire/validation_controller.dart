import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/_internal/utils/utils.dart';
import 'package:prapare/controllers/controllers.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';
import 'package:prapare/ui/views/survey/group_controller.dart';

class ValidationController extends GetxController {
  final UserResponsesController _responsesController = Get.find();

  /// A global key that holds the state of a form
  /// is used by nested TextFormField widgets for validation
  final formKey = GlobalKey<FormState>();

  // holds state of which tabs are checked, mapped by survey code
  final Map<String, RxBool> _groupValidatorsMap = <String, RxBool>{};
  Map<String, RxBool> get groupValidatorsMap => _groupValidatorsMap;

  /// holds state of each question's validators, specifically
  /// 1) has a question been answered? or 2) declined to answer?
  /// 3) if a radio button is present, what is currently selected?
  final Map<String, QuestionValidators> _questionValidatorsMap =
      <String, QuestionValidators>{};
  Map<String, QuestionValidators> get questionValidatorsMap =>
      _questionValidatorsMap;

  QuestionValidators getQuestionValidatorByUserResponse(
      Rx<UserResponse> userResponse) {
    final String groupAndQuestionId =
        LinkIdUtil().getGroupAndQuestionId(userResponse.value.questionLinkId);
    return _questionValidatorsMap[groupAndQuestionId];
  }

  bool validateIfQuestionIsCompleted(Rx<UserResponse> userResponse) {
    final String groupAndQuestionId =
        LinkIdUtil().getGroupAndQuestionId(userResponse.value.questionLinkId);
    final QuestionValidators qValidators =
        getQuestionValidatorByUserResponse(userResponse);

    bool _isQuestionAnswered = false;

    if (userResponse.value.questionLinkId != groupAndQuestionId) {
      //subquestion
      // todo: handle subquestion data
      _isQuestionAnswered = _validateSubQuestion();
    } else {
      // validate based on question type
      _isQuestionAnswered =
          _validateAnswerResponseListHasData(userResponse.value.answers);
    }

    if (qValidators.isDeclineToAnswerSelected.value) {
      qValidators.isDeclineToAnswerSelected.value = !_isQuestionAnswered;
      qValidators.isQuestionAnswered.value = _isQuestionAnswered;
      return true;
    } else {
      return qValidators.isQuestionAnswered.value = _isQuestionAnswered;
    }
  }

  bool _validateSubQuestion() => false;

  bool validateIfGroupIsCompleted(String questionCode) {
    final String groupCode = LinkIdUtil().getGroupId(questionCode);

    // create temporary map of all user responses for a given group
    final Map<String, Rx<UserResponse>> groupResponses = {};

    _responsesController.userResponsesMap.forEach(
      (questId, usrResp) {
        final String grpId = LinkIdUtil().getGroupId(questId);
        if (grpId == groupCode) {
          // put if absent will ignore if the key already exists
          // currently, nested questions have separate keys and are handled later
          groupResponses.putIfAbsent(questId, () => usrResp);
        }
      },
    );

    // Sort the groupResponses map into a new map of unique questionIds
    final Map<String, Map<String, Rx<UserResponse>>> questionResponses = {};
    groupResponses.forEach(
      (questId, usrResp) {
        final String qIdParsed = LinkIdUtil().getQuestionId(questId);
        // create outer map (for each question) if not present
        questionResponses.putIfAbsent(qIdParsed, () => {});
        // add inner sub-question items
        questionResponses[qIdParsed].putIfAbsent(questId, () => usrResp);
      },
    );

    bool validator = false;
    final List<bool> questionValidators = [];

    questionResponses.forEach(
      (qIdParsed, nestedResp) {
        final List<bool> nestedValidators = [];

        // first, add all nested questions to an internal validator
        nestedResp.forEach(
          (questId, usrResp) => nestedValidators.add(
            // check each question to see if data are stored
            _validateAnswerResponseListHasData(usrResp.value.answers) ||
                // note that a declined question also counts as answered
                questionValidatorsMap[questionCode]
                    .isDeclineToAnswerSelected
                    .value,
          ),
        );

        // then, if at least one response is considered valid, return true
        questionValidators.add(nestedValidators.any((e) => e));
      },
    );

    /// finally, if eveyr question has a true response
    /// set the primary validator to true
    validator = questionValidators.every((e) => e);

    // then update the tab list, so that checkmarks are shown/hidden
    _updateTabListWithValidator(groupCode, validator);

    return validator;
  }

  bool _validateAnswerResponseListHasData(List<AnswerResponse> answerList) {
    bool validator = false;
    if (answerList.isEmpty) {
      validator = false;
      return validator;
    }
    final List<bool> answerListValidators = [];
    answerList.forEach(
      (ans) {
        // check each answer, determine validation based on its type
        switch (ans.runtimeType) {

          // the presence of at least one item implies it has a value
          case AnswerCode:
          case AnswerOther:
            {
              answerListValidators.add(true);
              break;
            }

          // in order to have a value, item must be non-null
          case AnswerBoolean:
          case AnswerDecimal:
          case AnswerInteger:
            {
              answerListValidators.add(ans.value != null);
              break;
            }

          // in order to have a value, item must be non-null and non-empty
          case AnswerString:
          case AnswerText:
            {
              answerListValidators.add(ans.value != '' && ans.value != null);
              break;
            }
          // for now, all other values are not handled and considered empty
          // todo: handle other Answer types
          default:
            answerListValidators.add(false);
        }
      },
    );
    // if every answerListValidator is true, set the initial validator to true, otherwise it remains false
    validator = answerListValidators.every((e) => e);

    return validator;
  }

  void _updateTabListWithValidator(String groupCode, bool validator) {
    final GroupController _groupController = Get.find();

    /// get relevant SurveyTab, and toggle it as checked
    /// since we used parse util for groupCode, which removed the '/'
    /// we will parse these values as well for consistency

    _groupController.tabModel.tabList
        .firstWhere((e) => LinkIdUtil().getGroupId(e.code) == groupCode)
        .isChecked
        .value = validator;
  }

  // skip the last tab item (optional), then see if all are checked
  bool validateIfRequiredGroupsAreComplete() {
    final GroupController _groupController = Get.find();
    return _groupController.tabModel.tabList
        .take(_groupController.tabModel.tabList.length - 1)
        .every((e) => e.isChecked.value);
  }
}
