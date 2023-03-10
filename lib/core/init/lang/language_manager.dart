import 'package:flutter/material.dart';

import '../../enums/core_locale.dart';

class LanguageManager {
  static LanguageManager? _instance;
  static LanguageManager get instance {
    _instance ??= LanguageManager._init();
    return _instance!;
  }

  LanguageManager._init();


  List<Locale> get supportedLocales => CoreLocale.supportedLocales;

}
