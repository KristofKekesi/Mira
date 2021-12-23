// Dart
import 'dart:async';
import 'dart:convert';

// Flutter
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  AppLocalizations(this.locale);
  final Locale locale;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
  _AppLocalizationsDelegate();

  late Map<String, String> _localizedStrings;

  Future<Map<String, dynamic>> load() async {
    String jsonString =
    await rootBundle.loadString('lib/trans/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return Future.error("error loading translation");
  }

  // These methods will be called from every widget which needs a localized text
  String translate(String key) {
    if (_localizedStrings[key] == null) { if (kDebugMode) {
      print("Key wasn't found when trying $key as key");
    } }
    return _localizedStrings[key] ?? key ;
  }

  String? translateWithoutNullSafety(String key) {
    if (_localizedStrings[key] == null) { if (kDebugMode) {
      print("Key wasn't found when trying $key as key");
    } }
    return _localizedStrings[key];
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  // This delegate instance will never change (it doesn't even have fields!)
  // It can provide a constant constructor.
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    // Include all of your supported language codes here
    return ['en', 'hu', 'de', 'da'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    // AppLocalizations class is where the JSON loading actually runs
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}