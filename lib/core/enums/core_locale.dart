import 'package:flutter/material.dart';

enum CoreLocale {
  en(Locale("en", "US")),
  tr(Locale("tr", "TR"));

  const CoreLocale(this.locale);
  final Locale locale;

  static List<Locale> get supportedLocales => CoreLocale.values.map((e) => e.locale).toList();
  static CoreLocale fromLocale(Locale locale) {
    switch (locale.languageCode) {
      case 'en':
        return CoreLocale.en;
      case 'tr':
        return CoreLocale.tr;
      default:
        throw Exception('Unsupported locale: $locale');
    }
  }
}
