import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

import 'group_detail_expansion_panel.dart';
import 'question/question_items.dart';

List<Widget> groupDetailBuilder({@required ItemGroup group}) {
  final List<SurveyItem> surveyItems = group.surveyItems;
  // Create blank list for builder.
  final List<Widget> widgetList = [];

  if (surveyItems.isNotEmpty) {
    surveyItems.forEach(
      (entry) => widgetList.add(_parseSurveyItem(group, entry, widgetList)),
    );
  } else {
    widgetList
        .add(Container(child: const Text('no data in this SurveyItem List')));
  }
  return widgetList;
}

Widget _parseSurveyItem(
    ItemGroup group, SurveyItem entry, List<Widget> widgetList) {
  /// ItemGroups have extra padding + 'wrap' widget
  if (entry is ItemGroup) {
    /// Put new group in a temporary list that has 'wrapped' items
    /// wrapped items display differently on horiz vs vertical layouts
    return groupDetailExpansionPanel(
        entry, _buildSubItemWrappedList(entry, widgetList));
  } else {
    /// most items follow this path
    return _addItem(group, entry);
  }
}

List<Widget> _buildSubItemWrappedList(
    SurveyItem entry, List<Widget> widgetList) {
  // then add visual space for sub-items
  // sub items are wrapped in a sized box, so they take 1/2 the screen (- padding from either side)
  return [
    Wrap(
      alignment: WrapAlignment.spaceEvenly,
      direction: Axis.horizontal,
      children: (entry as ItemGroup).surveyItems.map((SurveyItem subEntry) {
        return Container(
          alignment: Alignment.center,
          // current left/right padding: 24, add 8 for new padding
          width: (Get.mediaQuery.size.width / 2) - 32,
          child: _parseSurveyItem(entry, subEntry, widgetList),
        );
      }).toList(),
    )
  ];
}

Widget _addItem(ItemGroup group, SurveyItem entry) {
  // standard path for creating a question
  if (entry is Question) {
    return groupDetailExpansionPanel(
      entry,
      [
        QuestionItems(group: group, question: entry),
        const SizedBox(height: 16),
      ],
    );
  } else
    return Container(
        child: const Text('error: not sure how to parse data item'));
}
