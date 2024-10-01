import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = AsyncNotifierProvider<AppThemeController, ThemeMode>(
  () => AppThemeController(),
);

class AppThemeController extends AsyncNotifier<ThemeMode> {
  @override
  Future<ThemeMode> build() async {
    return ThemeMode.system;
  }

  void setLightMode() {
    state = const AsyncData(ThemeMode.light);
  }

  void setDarkMode() {
    state = const AsyncData(ThemeMode.dark);
  }

  void setSystemMode() {
    state = const AsyncData(ThemeMode.system);
  }
}
