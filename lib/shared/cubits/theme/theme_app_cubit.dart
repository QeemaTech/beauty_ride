import 'package:beauty_ride/core/theme/theme_app.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_app_state.dart';

class ThemeAppCubit extends Cubit<ThemeAppState> {
  ThemeAppCubit() : super(LightTheme());

  Future<void> loadTheme() async {
    final pref = await SharedPreferences.getInstance();
    final isDark = pref.getBool("isDark") ?? false;
    emit(isDark ? DarkTheme() : LightTheme());
  }

  Future<void> toggleTheme() async {
    final pref = await SharedPreferences.getInstance();
    if (state is LightTheme) {
      emit(DarkTheme());
      await pref.setBool("isDark", true);
    } else {
      emit(LightTheme());
      await pref.setBool("isDark", false);
    }
  }

  // Keep old method name for backward compatibility
  Future initTheme() async {
    await toggleTheme();
  }
}
