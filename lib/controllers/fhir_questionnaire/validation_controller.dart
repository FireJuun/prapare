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

  /// holds state of which questions have enableWhen booleans
  /// first key: questionId
  /// second key: answerCode (note that this is the lastAnswerCode)
  final Map<QuestionEnableWhen, RxBool> _questionEnableWhenValidatorsMap =
      <QuestionEnableWhen, RxBool>{};
  Map<QuestionEnableWhen, RxBool> get questionEnableWhenValidatorsMap =>
      _questionEnableWhenValidatorsMap;

  // *******************************************************************
  // *************** CUSTOM GETTERS AND SETTERS ************************
  // *******************************************************************

  RxBool getEnableWhenBool(Question question, Answer answer) {
    final lastAnswerCode = LinkIdUtil().getLastId(answer.code);
    RxBool _bool;
    _questionEnableWhenValidatorsMap.forEach(
      (key, value) {
        if (key.questionLinkId == question.linkId &&
            key.answerCode == lastAnswerCode) {
          _bool = value;
        }
      },
    );
    return _bool;
  }

  QuestionValidators getQuestionValidatorByUserResponse(
      Rx<UserResponse> userResponse) {
    final String groupAndQuestionId =
        LinkIdUtil().getGroupAndQuestionId(userResponse.value.questionLinkId);
    return _questionValidatorsMap[groupAndQuestionId];
  }

  void setQuestionAnswered(String questionLinkId, bool newValue) =>
      questionValidatorsMap[LinkIdUtil().getGroupAndQuestionId(questionLinkId)]
          .isQuestionAnswered
          .value = newValue;

  void setQuestionDeclined(String questionLinkId, bool newValue) =>
      questionValidatorsMap[LinkIdUtil().getGroupAndQuestionId(questionLinkId)]
          .isQuestionDeclined
          .value = newValue;

  // *******************************************************************
  // ******** VALIDATORS TO SEE IF A QUESTION SHOULD BE ENABLED ********
  // *******************************************************************

  /// 'root questions' are ones that directly stem off of a survey group
  bool isQuestionAtRoot(Question question) =>
      question.linkId == LinkIdUtil().getGroupAndQuestionId(question.linkId);

  /// 'nested questions' are basically subquestions
  bool isQuestionNested(Question question) =>
      question.linkId != LinkIdUtil().getGroupAndQuestionId(question.linkId);

  bool isAnswerAnEnableWhenOption(Question question, Answer answer) {
    final lastAnswerCode = LinkIdUtil().getLastId(answer.code);
    bool validator = false;

    if (question.questionEnableWhen != null) {
      _questionEnableWhenValidatorsMap.forEach(
        (key, value) {
          /// questions with enableWhen operator have matching questionLinkIds & answerCodes
          /// ...but their answer codes are not included in the questionLinkId
          if (question.linkId == key.questionLinkId) {
            if (lastAnswerCode == key.answerCode) {
              validator = true;
            }
          }
        },
      );
    }
    return validator;
  }

  bool isAnswerAnEnableWhenTarget(Question question, Answer answer) {
    bool validator = false;
    if (question.questionEnableWhen != null) {
      _questionEnableWhenValidatorsMap.forEach(
        (key, value) {
          /// questions with enableWhen target have matching answerCodes
          /// but their questionLinkIds don't match (target questionLinkId also contains the lastAnswerCode)
          if (answer.code == '${key.questionLinkId}/${key.answerCode}' &&
              question.linkId != key.questionLinkId) {
            validator = true;
          }
        },
      );
    }
    return validator;
  }

  // *******************************************************************
  // ******** VALIDATORS TO SEE IF QUESTION + GROUP HAVE DATA   ********
  // *******************************************************************

  bool validateIfQuestionAndGroupAreCompleted(Rx<UserResponse> userResponse) {
    final String groupAndQuestionId =
        LinkIdUtil().getGroupAndQuestionId(userResponse.value.questionLinkId);
    final QuestionValidators qValidators =
        getQuestionValidatorByUserResponse(userResponse);

    bool _isQuestionAnswered = false;
    bool _isQuestionDeclined = false;

    // check for subquestion
    if (userResponse.value.questionLinkId != groupAndQuestionId &&
        // nested 'choose not to respond' items are handled separately
        LinkIdUtil().getLastId(userResponse.value.questionLinkId) !=
            'LA30122-8') {
      //subquestion
      _isQuestionAnswered = _validateSubQuestion(groupAndQuestionId);
    } else {
      // validate based on question type
      _isQuestionAnswered =
          _validateAnswerResponseListHasData(userResponse.value.answers);
    }
    // note that a declined question takes priority counts as answered
    _isQuestionDeclined =
        questionValidatorsMap[groupAndQuestionId].isQuestionDeclined.value;

    qValidators.isQuestionAnswered.value = _isQuestionAnswered;

    _validateIfGroupIsCompleted(userResponse.value.questionLinkId);

    return _isQuestionAnswered || _isQuestionDeclined;
  }

  bool _validateSubQuestion(String groupAndQuestionId) {
    bool _isSubQuestionAnswered = false;

    _responsesController.userResponsesMap.forEach((qLinkId, usrResp) {
      if (qLinkId.contains(groupAndQuestionId)) {
        if (_validateAnswerResponseListHasData(usrResp.value.answers)) {
          _isSubQuestionAnswered = true;
        }
      }
    });

    return _isSubQuestionAnswered;
  }

  bool _validateIfGroupIsCompleted(String questionCode) {
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

        // add a single validator for this question, to see if it has been declined

        final qValidator = questionValidatorsMap[
            LinkIdUtil().combineGroupAndQuestionId(groupCode, qIdParsed)];
        if (qValidator != null) {
          nestedValidators.add(qValidator.isQuestionDeclined.value);
        }

        // add all nested questions to an internal validator
        nestedResp.forEach(
          (questId, usrResp) => nestedValidators.add(
              // check each question to see if data are stored
              _validateAnswerResponseListHasData(usrResp.value.answers)),
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
