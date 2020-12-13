import 'package:fhir/r4.dart';
import 'package:get/get.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

class UserResponseUtil {
  Rx<UserResponse> createBlankUserResponseByQuestionType(Question q) {
    switch (q.itemType) {

      /// Choice and Open-Choice use the AnswerList to provide all positive values
      /// All negative/false values are removed from this list
      /// Thus, these questions begin with a blank list
      case QuestionnaireItemType.choice:
      case QuestionnaireItemType.open_choice:
        return UserResponse(questionLinkId: q.linkId, answers: []).obs;

      /// For now, I'm setting the default boolean UserResponse to null
      /// It is possible to have 3-phase boolean responses (true / false / null), which we want to handle
      case QuestionnaireItemType.boolean:
        return UserResponse(
            questionLinkId: q.linkId,
            answers: [AnswerBoolean(q.linkId, null)]).obs;

      /// Decimals / Integers handled similarly to Question Mapping above, w/ default nulls
      case QuestionnaireItemType.decimal:
        return UserResponse(
            questionLinkId: q.linkId, answers: [AnswerDecimal(null)]).obs;
      case QuestionnaireItemType.integer:
        return UserResponse(
            questionLinkId: q.linkId, answers: [AnswerInteger(null)]).obs;

      /// Strings / text handled similarly to Question Mapping above, w/ default ''
      case QuestionnaireItemType.string:
        return UserResponse(
            questionLinkId: q.linkId, answers: [AnswerString('')]).obs;
      case QuestionnaireItemType.text:
        return UserResponse(questionLinkId: q.linkId, answers: [AnswerText('')])
            .obs;

      // todo: handle datetimes and other item types
      default:
        return UserResponse(
            questionLinkId: q.linkId, answers: [AnswerString('')]).obs;
    }
  }
}
