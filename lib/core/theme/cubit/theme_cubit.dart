import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/prefs_service.dart';

import '../../constants/app_constants.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState(themeMode: ThemeMode.light));

  static const _key = AppConstants.themeMode;

  Future<void> loadTheme() async {
    final themeString = PrefsService.getString(_key);
    if (themeString == 'dark') {
      emit(const ThemeState(themeMode: ThemeMode.dark));
    } else {
      emit(const ThemeState(themeMode: ThemeMode.system));
    }
  }

  Future<void> toggleTheme() async {
    final newMode = state.themeMode == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;

    await PrefsService.setString(
      _key,
      newMode == ThemeMode.dark ? 'dark' : 'light',
    );

    emit(ThemeState(themeMode: newMode));
  }
}
