part of 'survey_item.dart';

/// this class will represent a single question for a survey
class Question extends SurveyItem {
  Question({
    this.linkId,
    this.text,
    this.itemType,
    this.format,
    this.answers,
    this.mandatory,
    this.multiAnswer,
    this.subQuestions,
  });

  Question.fromItem(QuestionnaireItem item) {
    linkId = item.linkId;
    text = item.text;
    itemType = item.type;
    answers = <Answer>{};
    mandatory = item.required_ == null ? false : item.required_.result();
    multiAnswer = item.repeats == null ? false : item.repeats.result();
    subQuestions = <Question>[];

    /// if the question is a choice or open-choice, it means that there will be
    /// a pre-defined list of allowable answers to be displayed to the user
    if (item.type == QuestionnaireItemType.choice ||
        item.type == QuestionnaireItemType.open_choice) {
      /// the type is listed under the extension with the url
      /// http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl
      final ext = item.extension_.firstWhere(
          (searchExt) =>
              searchExt.url ==
              FhirUri(
                  'http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl'),
          orElse: () => null);

      /// under that extension is a valueCodeableConcept, containing a coding,
      /// with the system: http://hl7.org/fhir/questionnaire-item-control
      if (ext != null) {
        final coding = ext.valueCodeableConcept.coding.firstWhere(
            (searchCoding) =>
                searchCoding.system ==
                FhirUri('http://hl7.org/fhir/questionnaire-item-control'));

        /// we map the format to one of the allowed choices
        format = choiceType[coding.code];

        /// if we can't find it in that list, we state that it is an unknown
        /// format to differentiate it from those questions without a list
        /// of pre-defined choices
        format ??= QFormat.unknown;

        /// generate list of allowed answers
        item.answerOption
            ?.forEach((e) => answers.add(Answer.fromAnswerOption(e)));
      }
    }

    /// if we didn't assign a format above, then it will be none.
    format ??= QFormat.none;
  }

  /// this is the code that will be used to identfy the question and passed back
  String linkId;

  /// this will be the text in the question displayed to the user
  String text;

  /// this will be the list of possible answers to the question
  QuestionnaireItemType itemType;

  /// this will be the format of the question
  QFormat format;

  /// this will be the list of possible answers to the question
  Set<Answer> answers;

  /// if this is a required question
  bool mandatory;

  /// if more than one answer is allowed
  bool multiAnswer;

  /// if there are sub-questions, they will be listed here
  List<Question> subQuestions;
}
