import 'package:fhir/r4.dart';

import 'answer.dart';
import 'qformat.dart';

part 'item_group.dart';
part 'question.dart';

abstract class SurveyItem {
  SurveyItem(this.linkId, this.text);

  /// this is the unique code that identifies
  String linkId;

  /// this will be the text in the question displayed to the user
  String text;
}
