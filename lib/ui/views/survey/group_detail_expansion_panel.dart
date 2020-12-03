import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/_internal/utils/utils.dart';
import 'package:prapare/controllers/controllers.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

import 'question/question_title.dart';

Widget groupDetailExpansionPanel(SurveyItem entry, List<Widget> children) {
  final ValidationController controller = Get.find();
  final String groupAndQuestionId =
      LinkIdUtil().getGroupAndQuestionId(entry.linkId);
  final RxBool qIsExpanded =
      controller.rxQuestionValidatorsMap[groupAndQuestionId].isExpanded;

  // Only questions are wrapped in an expansion panel
  return (groupAndQuestionId == entry.linkId)
      ? Obx(
          // for now, each of these lists holds a single item
          // this can be optimized
          // todo: extract list into GroupDetailBuilder
          () => ExpansionPanelList(
            // expandedHeaderPadding: const EdgeInsets.all(12.0),
            expansionCallback: (int index, bool isExpanded) {
              qIsExpanded.value = !qIsExpanded.value;
            },
            children: [
              ExpansionPanel(
                isExpanded: qIsExpanded.value,
                canTapOnHeader: true,
                headerBuilder: (BuildContext context, bool isExpanded) =>
                    QuestionTitle(questionLinkId: entry.linkId),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // QuestionTitle(questionLinkId: entry.linkId),
                    ...children,
                  ],
                ),
              )
            ],
          ),
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
