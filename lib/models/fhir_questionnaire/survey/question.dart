// ignore_for_file: prefer_final_locals
part of 'survey_item.dart';

/// this class will represent a single question for a survey
class Question extends SurveyItem {
  Question({
    String linkId,
    String text,
    this.itemType,
    this.format,
    this.answers,
    this.mandatory,
    this.multiAnswer,
    this.subQuestions,
  }) : super(linkId, text);

  factory Question.fromItem(QuestionnaireItem item) {
    var question = Question(
        linkId: item.linkId,
        text: item.text,
        itemType: item.type,
        answers: <Answer>{},
        mandatory: item.required_ == null ? false : item.required_.result(),
        multiAnswer: item.repeats == null ? false : item.repeats.result(),
        subQuestions: <Question>[]);

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
        question.format = choiceType[coding.code];

        /// if we can't find it in that list, we state that it is an unknown
        /// format to differentiate it from those questions without a list
        /// of pre-defined choices
        question.format ??= QFormat.unknown;

        /// generate list of allowed answers
        item.answerOption
            ?.forEach((e) => answers.add(Answer.fromAnswerOption(e)));
      }
    }

    /// if we didn't assign a format above, then it will be none.
    question.format ??= QFormat.none;

    /// checks if there are nested subItems for this question, if there are,
    /// it will add each of them in turn
    if (item.item != null) {
      if (item.item.isNotEmpty) {
        for (var subItem in item.item) {
          question.subQuestions.add(Question.fromItem(subItem));
        }
      }
    }

    return question;
  }

  /// This will be the list of possible answers to the question, for instance,
  /// choice would be QuestionnaireItemType.choice. Other allowed values (for
  /// use in this class), are boolean, decimal, integer, date, dateTime, time,
  /// string, text, url, choice, open_choice, attachment, reference, quantity,
  /// and invalid.
  ///
  /// These will be the expected types of answers returned for this question.
  ///
  /// Boolean, integer and dateTime are the same as their dart cognates
  ///
  /// Decimal will be a Dart double
  ///
  /// Date and Time will both be passed as a Dart DateTime, but the time or date
  /// (respectively) will be ignored when the response is created
  ///
  /// String and text are both Strings, although FHIR expects text to be a
  /// shorter text field
  ///
  /// Url will also be a string
  ///
  /// Attachment, reference and quantity are FHIR classes and not fully
  /// implemented here yet
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
