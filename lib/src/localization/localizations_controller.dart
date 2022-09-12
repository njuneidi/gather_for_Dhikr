import 'package:dhikr/src/localization/localizations_service.dart';
import 'package:dhikr/src/settings/settings_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocalizationsController extends StateNotifier<Locale> {
  LocalizationsController(this._localizationsService)
      : super(const Locale('ar', 'PS'));
  final LocalizationsService _localizationsService;

  late Locale _locale;

  // Allow Widgets to read the user's preferred ThemeMode.
  Locale get locale => _locale;

  Future<void> loadSettings() async {
    state = await _localizationsService.locale();
    _locale = state;

    // Important! Inform listeners a change has occurred.
  }

  Future<void> setLocale(String languageCode) async {
    state = Locale(languageCode);
    if (languageCode.isEmpty) return;
    if (languageCode == _locale.languageCode) return;
    _locale = Locale(languageCode);
    await _localizationsService.setLocale(languageCode);
  }

  //void setArabic() => state = const Locale('ar', 'PS');
  //void setEnglish() => state = const Locale('en', 'US');
}

final localizationControllerProvider =
    StateNotifierProvider.autoDispose<LocalizationsController, Locale?>((ref) {
  final localizationsService = LocalizationsService();
  return LocalizationsController(localizationsService);
});
