// Dart
import "dart:async";
import "dart:convert";

// Flutter
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";

/// Translations
class AppLocalizations {
  /// Constructor
  AppLocalizations(this.locale);

  /// Locale
  final Locale locale;

  /// AppLocalizations
  static AppLocalizations of(BuildContext context) =>
      Localizations.of<AppLocalizations>(context, AppLocalizations)!;

  /// Delegate
  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  late Map<String, String> _localizedStrings;

  /// Loading translations from JSON files.
  Future<bool> load() async {
    try {
      final String jsonString =
          await rootBundle.loadString("lib/trans/${locale.languageCode}.json");
      final Map<String, dynamic> jsonMap = json.decode(jsonString);

      _localizedStrings = jsonMap.map(
        //ignore: always_specify_types
        (String key, value) => MapEntry<String, String>(
          key,
          value.toString(),
        ),
      );

      return true;
    } on Exception catch (error) {
      //ignore: always_specify_types
      return Future.error("Error loading translation. "
          "Tried ${locale.languageCode}.json. "
          "Reason: $error",);
    }
  }

  /// This method will return a [String] given a key.
  String translate(String key) {
    if (_localizedStrings[key] == null) {
      if (kDebugMode) {
        print("Key wasn't found when trying $key as key.");
      }
    }
    return _localizedStrings[key] ?? key;
  }

  /// These method will return a nullable [String] given a key.
  String? translateWithoutNullSafety(String key) {
    if (_localizedStrings[key] == null) {
      if (kDebugMode) {
        print(
          "Key wasn't found when trying $key as key. This method was created "
          "to return nullable strings, if not required please use the "
          "translate method!",
        );
      }
    }
    return _localizedStrings[key];
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      <String>["en", "hu", "de", "da"].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
