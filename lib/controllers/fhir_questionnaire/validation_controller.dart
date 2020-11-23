import 'package:get/get.dart';
import 'package:prapare/_internal/utils/utils.dart';
import 'package:prapare/controllers/controllers.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';
import 'package:prapare/ui/views/survey/group_controller.dart';

class ValidationController extends GetxController {
  final QuestionnaireController _questionnaireController = Get.find();
  final UserResponsesController _responsesController = Get.find();
  final GroupController _groupController = Get.find();

  // holds state of which tabs are checked, mapped by survey code
  final RxMap<String, RxBool> _rxMappedValidatedGroups = <String, RxBool>{}.obs;
  RxMap<String, RxBool> get rxMappedValidatedTabs => _rxMappedValidatedGroups;

  bool validateIfGroupIsCompleted(String questionCode) {
    final String groupCode = LinkIdUtil().getGroupId(questionCode);

    // create temporary map of all user responses for a given group
    final Map<String, Rx<UserResponse>> groupResponses = {};
    _responsesController.rxUserResponsesMap.forEach(
      (questId, usrResp) {
        final String grpId = LinkIdUtil().getGroupId(questId);
        if (grpId == groupCode) {
          // put if absent will ignore if the key already exists
          // currently, nested questions have separate keys and are handled later
          groupResponses.putIfAbsent(questId, () => usrResp);
        }
      },
    );

    bool validator = false;
    final List<bool> responseGroupValidators = [];

    // todo: handle validation of nested questions
    groupResponses.forEach(
      (questId, usrResp) => responseGroupValidators.add(
        validateAnswerResponseListHasData(usrResp.value.answers),
      ),
    );

    // if every responseGroupValidator is true, set the initial validator to true, otherwise it remains false
    validator = responseGroupValidators.every((e) => e);

    // then update the tab list, so that checkmarks are shown/hidden
    _updateTabListWithValidator(groupCode, validator);

    return validator;
  }

  bool validateAnswerResponseListHasData(List<AnswerResponse> answerList) {
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
    /// get relevant SurveyTab, and toggle it as checked
    /// since we used parse util for groupCode, which removed the '/'
    /// we will parse these values as well for consistency

    _groupController.tabModel.tabList
        .firstWhere((e) => LinkIdUtil().getGroupId(e.code) == groupCode)
        .isChecked
        .value = validator;
  }

  // skip the last tab item (optional), then see if all are checked
  bool validateIfRequiredGroupsAreComplete() =>
      _groupController.tabModel.tabList
          .take(_groupController.tabModel.tabList.length - 1)
          .every((e) => e.isChecked.value);

  // create empty validators with false as default
  void _mapAllGroupValidators() {
    _questionnaireController
        .getQuestionnaire()
        .survey
        .surveyItems
        .forEach((s) => _rxMappedValidatedGroups.add(s.linkId, false.obs));
  }

  @override
  void onInit() {
    _mapAllGroupValidators();
    super.onInit();
  }
}
