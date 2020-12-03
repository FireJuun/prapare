import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/_internal/components/custom.dart' as custom;
import 'package:prapare/_internal/utils/utils.dart';
import 'package:prapare/controllers/controllers.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

import 'question/question_title.dart';

Widget groupDetailExpansionTile(SurveyItem entry, List<Widget> children) {
  final ValidationController controller = Get.find();
  final String groupAndQuestionId =
      LinkIdUtil().getGroupAndQuestionId(entry.linkId);
  final QuestionValidators validators =
      controller.rxQuestionValidatorsMap[groupAndQuestionId];
  final bool shouldBeExpanded =
      !validators.isDeclineToAnswerSelected.value ?? true;

  // Only questions are wrapped in an expansion tile
  return (groupAndQuestionId == entry.linkId)
      ? custom.ExpansionTile(
          key: PageStorageKey(entry.linkId),
          maintainState: true,
          title: QuestionTitle(questionLinkId: entry.linkId),
          onExpansionChanged: (bool newValue) {
            validators.isDeclineToAnswerSelected.value = newValue;
          },
          initiallyExpanded: shouldBeExpanded,
          children: children,
        )
      // SubQuestions are instead wrapped in a column
      : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            QuestionTitle(questionLinkId: entry.linkId),
            ...children,
          ],
        );
}
