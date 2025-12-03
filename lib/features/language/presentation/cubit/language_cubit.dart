import 'package:beauty_ride/core/storage/pref_services.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitial()) {
    _loadLanguage();
  }

  static const String _languageKey = 'app_language';
  Locale? _selectedLocale; // Temporary selection before saving
  Locale? _savedLocale; // Saved locale

  Future<void> _loadLanguage() async {
    final savedLanguage = PrefServices.instance.getData(key: _languageKey);
    if (savedLanguage != null) {
      _savedLocale = Locale(savedLanguage);
      _selectedLocale = _savedLocale;
      emit(LanguageLoaded(_savedLocale!));
    } else {
      // Default to Arabic
      _savedLocale = const Locale('ar');
      _selectedLocale = _savedLocale;
      emit(LanguageLoaded(_savedLocale!));
    }
  }

  // Select language temporarily (before saving)
  void selectLanguage(Locale locale) {
    _selectedLocale = locale;
    emit(LanguageSelected(locale, _savedLocale ?? const Locale('ar')));
  }

  // Save the selected language and apply it
  Future<void> saveLanguage() async {
    if (_selectedLocale != null) {
      await PrefServices.instance.saveData(
        key: _languageKey,
        value: _selectedLocale!.languageCode,
      );
      _savedLocale = _selectedLocale;
      emit(LanguageLoaded(_selectedLocale!));
    }
  }

  Locale get currentLocale {
    if (state is LanguageLoaded) {
      return (state as LanguageLoaded).locale;
    } else if (state is LanguageSelected) {
      return (state as LanguageSelected).selectedLocale;
    }
    return _selectedLocale ?? const Locale('ar');
  }

  Locale get savedLocale {
    return _savedLocale ?? const Locale('ar');
  }

  bool get hasChanges {
    return _selectedLocale != null && _selectedLocale != _savedLocale;
  }
}
