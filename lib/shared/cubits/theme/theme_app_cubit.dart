import 'package:beauty_ride/core/theme/theme_app.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_app_state.dart';

class ThemeAppCubit extends Cubit<ThemeAppState> {
  ThemeAppCubit() : super(DarkTheme());

  Future<void> loadTheme() async {
    final pref = await SharedPreferences.getInstance();
    final isDark = pref.getBool("isDark") ?? false;
    emit(isDark ? DarkTheme() : LightTheme());
  }

  Future initTheme() async {
    final pref = await SharedPreferences.getInstance();
    if (state is LightTheme) {
      emit(DarkTheme());
      await pref.setBool("isDark", true);
    } else {
      emit(LightTheme());
      await pref.setBool("isDark", false);
    }
  }
}
