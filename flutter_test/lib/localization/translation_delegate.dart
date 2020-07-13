import 'package:flutter/material.dart';
import 'package:flutter_tdd_example/localization/translation.dart';

class TranslationDelegate extends LocalizationsDelegate<Translation> {
  @override
  bool isSupported(Locale locale) => ['ko', 'en'].contains(locale.languageCode);

  @override
  Future<Translation> load(Locale locale) async {
    Translation translation = Translation(locale);
    await translation.initialLoad();
    return translation;
  }

  @override
  bool shouldReload(LocalizationsDelegate<Translation> old) => false;
}
