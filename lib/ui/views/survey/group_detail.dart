import 'package:flutter/material.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';
import 'package:prapare/ui/views/survey/group_detail_builder.dart';

class GroupDetail extends StatelessWidget {
  const GroupDetail({Key key, @required this.group})
      : assert(group != null),
        super(key: key);

  final ItemGroup group;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: groupDetailBuilder(group: group),
    );
  }
}
