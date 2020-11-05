import 'package:get/get.dart';

import 'lang/export.dart';

class MyTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ar': arLang,
        'bn': bnLang,
        'en': enLang,
        'es': esLang,
        'fr': frLang,
        'hi': hiLang,
        'id': idLang,
        'mr': mrLang,
        'pa': paLang,
        'pt': ptLang,
        'ru': ruLang,
        'th': thLang,
        'zh': zhcnLang,
        'zh-cn': zhcnLang,
      };
}
