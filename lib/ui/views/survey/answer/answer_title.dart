import 'package:flutter/material.dart';
import 'package:prapare/_internal/utils/prapare_codes_util.dart';
import 'package:prapare/localization.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

class AnswerTitle extends StatelessWidget {
  const AnswerTitle({Key key, @required this.answer})
      : assert(answer != null),
        super(key: key);

  final Answer answer;

  @override
  Widget build(BuildContext context) {
    final PrapareCodesUtil codesUtil = PrapareCodesUtil();
    final AppLocalizations_Labels labels = AppLocalizations.of(context);

    return Text(codesUtil.getAnswerFromLinkIdAndLocale(answer.code, labels));
  }
}
