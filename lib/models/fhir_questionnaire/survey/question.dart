import 'package:fhir/r4.dart';
import 'package:prapare/models/fhir_questionnaire/survey/survey_item.dart';

import 'answer.dart';
import 'qformat.dart';

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

// Question.fromChoiceItem(QuestionnaireItem item) {
//   /// unique id for item in Questionnaire
//   code = item.linkId;

//   /// Primary text for item (although not required)
//   text = item.text;

//   /// just defines itemType, it is required in FHIR
//   itemType = itemTypeMap[item.type.toString().split('.')[1]];

//   if (itemType != ItemType.group &&
//       itemType != ItemType.display &&
//       itemType != ItemType.question) {
//     ///  initialize the answer list
//     answers = <Answer>{};
//     if (itemType != ItemType.choice) {
//       format = questionMap[item.type.toString()];
//       switch (itemType) {
//         case ItemType.decimal:
//           answers.add(Answer(code: 'decimal', text: ''));
//           break;
//         case ItemType.string:
//           answers.add(Answer(code: 'string', text: ''));
//           break;
//         default:
//           break;
//       }
//       // todo: verify Answer().code for string / decimal is what we want
//     } else {
//       if (item.extension_ != null) {
//         /// ensures that there is an extension for the item
//         final FhirExtension ext = item.extension_.firstWhere(
//           (ext) =>
//               ext.url ==
//               FhirUri(
//                 'http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl',
//               ),
//           orElse: () => null,
//         );

//         /// ensures the extension has a codeable concept with coding
//         if (ext?.valueCodeableConcept?.coding != null) {
//           /// looks for the first CodeableConcept that defines the question type
//           final Code qformat = ext.valueCodeableConcept.coding
//               .firstWhere((coding) =>
//                   coding.system ==
//                   FhirUri('http://hl7.org/fhir/questionnaire-item-control'))
//               .code; // and extracts the code

//           /// this code is then changed to an enum for easy use by us
//           format = qType[qformat];
//         }
//       }
//     }

//     /// then create each answer in the list
//     // todo: this only works for [ItemType.choice] answers
//     item.answerOption
//         ?.forEach((e) => answers.add(Answer.fromAnswerOption(e)));
//   }
// }
