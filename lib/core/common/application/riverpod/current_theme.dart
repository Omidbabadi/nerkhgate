import 'package:flutter/material.dart';
import 'package:myapp/core/common/common/singelton/core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../services/injection_container.dart';
import '../cache_helper.dart';

part 'current_theme.g.dart';

@Riverpod(keepAlive: true)
class CurrentTheme extends _$CurrentTheme {
  final ValueNotifier<ThemeMode> _notifier = Cache.instance.themeModeNotifier;
  @override
  ThemeMode build() {
    final initialThemeMode = sl<CacheHelper>().getThemeMode();
  
    _notifier.addListener(_onThemeChanged);

    ref.onDispose(() {
      _notifier.removeListener(_onThemeChanged);
    });

    return initialThemeMode;
  }

   void _onThemeChanged() {
    if (state != _notifier.value) {
      state = _notifier.value;
    }
  }


  void toggleTheme(ThemeMode theme) {
    final newMode = switch (theme) {
      ThemeMode.light => ThemeMode.dark,
      ThemeMode.dark => ThemeMode.system,
      ThemeMode.system => ThemeMode.light,
    };
    sl<CacheHelper>().cacheThemeMode(newMode);
  }

  
}
