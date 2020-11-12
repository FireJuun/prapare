import 'package:fhir/r4.dart';

import 'answer.dart';
import 'item_type.dart';
import 'qformat.dart';

/// this class will represent a single question for a survey
class Question {
  Question({this.code, this.text, this.answers, this.itemType, this.format});

  Question.fromChoiceItem(QuestionnaireItem item) {
    /// unique id for item in Questionnaire
    code = item.linkId;

    /// Primary text for item (although not required)
    text = item.text;

    /// just defines itemType, it is required in FHIR
    itemType = itemTypeMap[item.type.toString()];

    if (itemType != ItemType.group &&
        itemType != ItemType.display &&
        itemType != ItemType.question) {
      if (itemType != ItemType.choice) {
        format = questionMap[item.type.toString()];
      } else {
        if (item.extension_ != null) {
          /// ensures that there is an extension for the item
          final FhirExtension ext = item.extension_.firstWhere(
            (ext) =>
                ext.url ==
                FhirUri(
                  'http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl',
                ),
            orElse: () => null,
          );

          /// ensures the extension has a codeable concept with coding
          if (ext?.valueCodeableConcept?.coding != null) {
            /// looks for the first CodeableConcept that defines the question type
            final Code qformat = ext.valueCodeableConcept.coding
                .firstWhere((coding) =>
                    coding.system ==
                    FhirUri('http://hl7.org/fhir/questionnaire-item-control'))
                .code; // and extracts the code

            /// this code is then changed to an enum for easy use by us
            format = qType[qformat];
          }
        }
      }
    }

    /// initialize the answer list, then create each answer in the list
    answers = <Answer>{};
    for (var answer in item.answerOption) {
      answers.add(Answer.fromAnswerOption(answer));
    }
  }

  /// this is the code that will be used to identfy the question and passed back
  String code;

  /// this will be the text in the question displayed to the user
  String text;

  /// this will be the list of possible answers to the question
  Set<Answer> answers;

  /// this will be the list of possible answers to the question
  ItemType itemType;

  /// this will be the format of the question
  QFormat format;
}
