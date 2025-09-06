import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../services/injection_container.dart';
import '../cache_helper.dart';

part 'current_theme.g.dart';

@Riverpod(keepAlive: true)
class CurrentTheme extends _$CurrentTheme {
  @override
  ThemeMode build() {
    final themeMode = sl<CacheHelper>().getThemeMode();
    return themeMode;
  }

  void toggleTheme() {
        final newMode = switch (state) {
      ThemeMode.light => ThemeMode.dark,
      ThemeMode.dark => ThemeMode.system,
      ThemeMode.system => ThemeMode.light,
    };
    // ذخیره تم جدید
    sl<CacheHelper>().cacheThemeMode(newMode);
  }

  IconData getThemeIcon(){


    return switch (state) {
      ThemeMode.light => Icons.dark_mode_outlined,
      ThemeMode.dark => Icons.auto_awesome_outlined,
      ThemeMode.system => Icons.light_mode_outlined,
    };
  

  }
}
