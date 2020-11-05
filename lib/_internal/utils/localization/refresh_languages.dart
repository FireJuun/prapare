import 'dart:convert';
import 'dart:io';
import 'package:prapare/strings.dart';
import 'package:translator/translator.dart';

import 'available_languages.dart';

/// spec: https://github.com/Dokotela/vigor/blob/main/lib/localization/refresh_languages.dart
/// This dart program refreshes all [lang] translations
/// !!! Important: FOLLOW THESE STEPS BEFORE USE !!!
/// Ensure all strings are represented in [stringList]
/// Delete all .tr extensions in [strings.dart]
/// Comment out [package:get/utils.dart]
/// Run in terminal: `dart lib/_internal/utils/localization/refresh_languages.dart`
/// Then re-enable the get/utils and re-add .tr

Future<void> main() async {
  final translator = GoogleTranslator();
  final languageList = availableLanguages();
  final List<String> phrases = stringList;

  var toReplace = replace(phrases.toString(), ['[', ']']);
  toReplace = toReplace.replaceAll(', ', '\n');

  for (final lang in languageList) {
    final newPhrases = //toReplace.toString();
        (await translator.translate(toReplace, to: lang['iso369-1']))
            .toString();
    final phraseList = newPhrases.toString().split('\n');
    for (var i = 0; i < phraseList.length; i++) {
      lang[phrases[i].replaceAll('**', '')] = phraseList[i];
    }

    // Temporarily disabled, as username not found in the list of phrases
    // lang['Username'] = lang['Username'].substring(1, lang['Username'].length);
    final file =
        'const ${lang['iso369-1'].replaceAll('-', '')}Lang = ${json.encode(lang)};';
    final singleQuoteFile = file.replaceAll('"', "'''");
    await File(
            "./lib/_internal/utils/localization/lang/${lang['iso369-1']}.dart")
        .writeAsString(singleQuoteFile);
  }
}

String replace(String original, List<String> replacements) {
  String returnOriginal;
  for (final replacement in replacements) {
    returnOriginal = original.replaceAll(replacement, '');
  }
  return returnOriginal;
}
