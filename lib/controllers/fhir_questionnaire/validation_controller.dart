import 'package:get/get.dart';
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

  bool validateIfGroupIsCompleted(String surveyCode) {
    final ItemGroup group =
        _questionnaireController.getGroupFromCode(surveyCode);
    // for each question in this survey...
    return group.surveyItems.every((q) {
      // check to see if the mapped active response has a boolean of true

      // blank radiobuttons have '' answer codes and false values
      // checkboxes will have true values, ?? in active response
      // todo: implement means to verify at least one checkbox is active
      final activeResponses =
          _responsesController.rxMappedActiveResponses[q.linkId];

      // since ResponseType varies, for now we are handling strings / bool
      final test = activeResponses.value.answers[0].value;
      if ((test is bool && test == true) || (test is String && test != '')) {
        // get relevant SurveyTab, and toggle it as checked
        _groupController.tabModel.tabList
            .firstWhere((e) => e.code == group.linkId)
            .isChecked
            .value = true;
        return true;
      } else {
        _groupController.tabModel.tabList
            .firstWhere((e) => e.code == group.linkId)
            .isChecked
            .value = false;
        return false;
      }
    });
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
