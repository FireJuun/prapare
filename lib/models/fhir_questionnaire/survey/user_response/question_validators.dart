import 'package:get/get.dart';

class QuestionValidators {
  QuestionValidators({
    RxBool isQuestionAnswered,
    RxBool isQuestionDeclined,
    RxBool isExpanded,
  })  : isQuestionAnswered = isQuestionAnswered ?? false.obs,
        isQuestionDeclined = isQuestionDeclined ?? false.obs,
        isExpanded = isExpanded ?? true.obs;

  final RxBool isQuestionAnswered;
  final RxBool isQuestionDeclined;
  final RxBool isExpanded;
}
