import 'package:get/get.dart';

class QuestionValidators {
  QuestionValidators({
    RxBool isQuestionAnswered,
    RxBool isDeclineToAnswerSelected,
    RxBool isExpanded,
  })  : isQuestionAnswered = isQuestionAnswered ?? false.obs,
        isDeclineToAnswerSelected = isDeclineToAnswerSelected ?? false.obs,
        isExpanded = isExpanded ?? true.obs;

  final RxBool isQuestionAnswered;
  final RxBool isDeclineToAnswerSelected;
  final RxBool isExpanded;
}
