import 'package:fhir/r4.dart';
import 'package:prapare/_internal/constants/string_to_qformat_map.dart';
import 'package:prapare/_internal/enums/qformat_enum.dart';
import 'package:prapare/_internal/utils/utils.dart';
import 'package:prapare/_internal/enums/item_type_enum.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

import '../answer.dart';

part 'item_group.dart';
part 'question.dart';

abstract class SurveyItem {
  SurveyItem(this.linkId, this.text);

  /// this is the unique code that identifies
  String linkId;

  /// this will be the text in the question displayed to the user
  String text;
}
