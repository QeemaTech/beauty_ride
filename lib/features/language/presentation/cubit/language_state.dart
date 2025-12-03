part of 'language_cubit.dart';

abstract class LanguageState extends Equatable {
  const LanguageState();

  @override
  List<Object> get props => [];
}

class LanguageInitial extends LanguageState {}

class LanguageLoaded extends LanguageState {
  final Locale locale;

  const LanguageLoaded(this.locale);

  @override
  List<Object> get props => [locale];
}

class LanguageSelected extends LanguageState {
  final Locale selectedLocale;
  final Locale savedLocale;

  const LanguageSelected(this.selectedLocale, this.savedLocale);

  @override
  List<Object> get props => [selectedLocale, savedLocale];
}
