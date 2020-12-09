import 'package:get/get.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

import '../controllers.dart';
import 'abstract_command.dart';

class SubmitQuestionnaireCommand extends AbstractCommand {
  @override
  Future<void> execute() async {
    final answerListObs = responsesController.userResponsesMap.values;
    var answerList = <UserResponse>[];
    answerListObs.forEach((v) => answerList.add(v.value));
    await questionnaireController.saveResponse(answerList);
  }
}
