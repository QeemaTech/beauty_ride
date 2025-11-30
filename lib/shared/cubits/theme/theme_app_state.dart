part of 'theme_app_cubit.dart';

sealed class ThemeAppState extends Equatable {
  const ThemeAppState(this.themeData);
  final ThemeData themeData;

  @override
  List<Object> get props => [];
}

final class ThemeAppInitial extends ThemeAppState {
  const ThemeAppInitial(super.themeData);
}

final class LightTheme extends ThemeAppState {
  LightTheme() : super(ThemeApp.lightTheme);
}

final class DarkTheme extends ThemeAppState {
  DarkTheme() : super(ThemeApp.darkTheme);
}
