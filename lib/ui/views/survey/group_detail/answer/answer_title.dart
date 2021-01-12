import 'package:flutter/material.dart';
import 'package:prapare/_internal/utils/utils.dart';
import 'package:prapare/_internal/utils/utils.dart';
import 'package:prapare/ui/localization.dart';
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

    final String answerCode = LinkIdUtil().getLastId(answer.code);

    return Text(codesUtil.getAnswerFromLinkIdAndLocale(answerCode, labels));
  }
}
