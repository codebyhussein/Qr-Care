import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }
  static LocalizationsDelegate<AppLocalizations> delegate= _DemoLocalizationsDelegate();
  late Map<String, String> _localizedValues;

  Future<void> load() async {
    String jsonStringValues =
    await rootBundle.loadString('assets/Lang/${locale.languageCode}.json');
    Map<String, dynamic> mappedJson = json.decode(jsonStringValues);
    _localizedValues =
        mappedJson.map((key, value) => MapEntry(key, value.toString()));
  }

  String? translate(String key) {
    return _localizedValues[key]??"";
  }
}

class _DemoLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _DemoLocalizationsDelegate();
  @override
  bool isSupported(Locale locale) {
    return ["en", "ar"].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale)async {
    AppLocalizations appLocalization=  AppLocalizations(locale);
    await appLocalization.load();
    return appLocalization;

  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;

}
