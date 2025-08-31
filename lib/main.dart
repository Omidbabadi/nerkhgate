import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/core/services/injection_container.dart';
import 'package:myapp/core/services/router.dart';
import './core/res/styles/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const ProviderScope(child:  MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colours.lightThemePrimaryColor,
      ),
      scaffoldBackgroundColor: Colours.lightThemeBackground,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colours.lightThemeBackground,
        foregroundColor: Colours.lightThemePrimaryTextColor,
      ),
      useMaterial3: true,
    );
    return MaterialApp.router(
      themeMode: ThemeMode.system,
      title: 'fee',
      routerConfig: router,
      theme: theme,
      darkTheme: theme.copyWith(
        scaffoldBackgroundColor: Colours.darkThemeBackground,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colours.darkThemeBackground,
          foregroundColor: Colours.darkThemePrimaryTextColor,
        ),
      ),
    );
  }
}
