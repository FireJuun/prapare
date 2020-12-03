import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/_internal/utils/utils.dart';
import 'package:prapare/controllers/controllers.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

import 'question/question_title.dart';

class GroupDetailExpansionPanel extends StatelessWidget {
  const GroupDetailExpansionPanel(
      {Key key, @required this.entry, @required this.children})
      : assert(entry != null),
        assert(children != null),
        super(key: key);

  final SurveyItem entry;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
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
              expansionCallback: (int index, bool isExpanded) {
                // close keyboard if previously open:
                FocusScope.of(context).unfocus();
                // toggle panel to expand/collapse
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
}
