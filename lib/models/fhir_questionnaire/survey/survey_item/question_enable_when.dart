import 'package:fhir/r4.dart';
import 'package:flutter/material.dart';

class QuestionEnableWhen {
  QuestionEnableWhen({
    this.questionLinkId,
    this.answerCode,
    // this.enableWhenOperator,
  });

  /// creates a QuestionEnableWhen object from the FHIR spec
  QuestionEnableWhen.fromEnableWhenList(
      {@required QuestionnaireEnableWhen listItem}) {
    questionLinkId = listItem?.question?.toString();

    /// Looking at the FHIR spec, I believe it's using the enableWhenOperator to determine Left or Right, but the operator itself isn't carrying over
    /// Since all of our enableWhen packages retrieve a Right(Code), I'm extracting the code via this method:
    /// https://stackoverflow.com/questions/58734044/how-to-extract-left-or-right-easily-from-either-type-in-dart-dartz
    final _code = listItem?.answerCoding?.code ?? Code('');
    answerCode = (_code.value.isRight()) ? _code.value.getOrElse(() => '') : '';

    print('quest, ans, enable');
  }

  /// specifies the question that
  String questionLinkId;

  /// this is answer code that should be displayed
  /// the package will use this code to identify and pass back the answer
  String answerCode;

  /// this is the operator (=, !=, >, <, etc) that will be used to determine if this item should be shown
  /// for now, this project is only looking at '=' operators
  // todo: enableWhenOperator retrieves null, so it's disabled
  /// fhir package needs to be corrected/updated to retrieve eq
  // QuestionnaireEnableWhenOperator enableWhenOperator;

}
