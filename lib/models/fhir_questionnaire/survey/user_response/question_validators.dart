import 'package:get/get.dart';

class QuestionValidators {
  QuestionValidators({
    RxBool isQuestionAnswered,
    RxBool isDeclineToAnswerSelected,
    RxString activeRadioButton,
  })  : isQuestionAnswered = isQuestionAnswered ?? false.obs,
        isDeclineToAnswerSelected = isDeclineToAnswerSelected ?? false.obs,
        activeRadioButton = activeRadioButton ?? ''.obs;

  final RxBool isQuestionAnswered;
  final RxBool isDeclineToAnswerSelected;
  final RxString activeRadioButton;
}
