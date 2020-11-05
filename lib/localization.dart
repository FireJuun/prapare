import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_sheet_localization/flutter_sheet_localization.dart';
import 'package:prapare/api_keys.dart';

// spec: https://github.com/aloisdeniel/flutter_sheet_localization
// also: https://github.com/delay/flutter_starter

part 'localization.g.dart';

@SheetLocalization(ApiKeys.localeSpreadsheetId, ApiKeys.localeSheetId,
    5) // <- See 1. to get DOCID and SHEETID
// the `1` is the generated version. You must increment it each time you want to regenerate
// a new version of the labels.
class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      AppLocalizations.languages.containsKey(locale);
  @override
  Future<AppLocalizations> load(Locale locale) =>
      SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
