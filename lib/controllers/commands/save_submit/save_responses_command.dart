import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

import '../abstract_command.dart';

class SaveResponsesCommand extends AbstractCommand {
  @override
  Future<void> execute() async {
    final answerListObs = responsesController.userResponsesMap.values;
    final List<UserResponse> answerList = <UserResponse>[];
    answerListObs.forEach((v) => answerList.add(v.value));
    await questionnaireController.saveResponse(answerList);
  }
}
