import 'package:fhir/r4.dart';
import 'package:flutter/material.dart';
import 'package:prapare/_internal/enums/item_type_enum.dart';

/// store the answers to your survey or questionnaire in this class
class Answer {
  Answer({this.code, this.text, @required ItemType answerItemType})
      // answerItemType defaults to invalid, if no value set
      : answerItemType = answerItemType ?? ItemType.invalid;

  /// creates an answer object from the FHIR QuestionnaireAnswerOption
  Answer.fromAnswerOption(
      {@required QuestionnaireItem questionnaireItem,
      @required QuestionnaireAnswerOption answer,
      @required this.answerItemType}) {
    /// typically as: /group/question/answer
    /// or as: /group/question/subquestion/answer
    code = questionnaireItem?.linkId.toString() +
        '/' +
        answer?.valueCoding?.code?.toString();
    text = answer?.valueCoding?.display?.toString();
  }

  /// this is code the package will use to identify and pass back the answer
  String code;

  /// this is the text that will be displayed to the user of the survey
  String text;

  ItemType answerItemType;
}
