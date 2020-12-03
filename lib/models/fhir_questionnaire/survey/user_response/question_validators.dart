import 'package:get/get.dart';

class QuestionValidators {
  QuestionValidators({
    RxBool isQuestionAnswered,
    RxBool isDeclineToAnswerSelected,
  })  : isQuestionAnswered = isQuestionAnswered ?? false.obs,
        isDeclineToAnswerSelected = isDeclineToAnswerSelected ?? false.obs;

  final RxBool isQuestionAnswered;
  final RxBool isDeclineToAnswerSelected;
}
