import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Translation {
  final Locale _locale;

  Translation(this._locale);

  static Translation of(BuildContext context) {
    return Localizations.of(context, Translation);
  }

  Map<String, String> _sentences;

  Future initialLoad() async {
    String data = await rootBundle
        .loadString('assets/locale/${_locale.languageCode}.json');
    _sentences = Map<String, String>.from(jsonDecode(data));
  }

  String trans(String key) {
    return _sentences[key];
  }
}
