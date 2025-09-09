part of 'router.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: rootNavigatorKey,
  debugLogDiagnostics: true,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',

      builder: (_, __) {
        return const SplashScreen();
      },
    ),
    GoRoute(path: ErrorScreen.path, builder: (_, __) => const ErrorScreen()),
    GoRoute(
      path: LoadingScreen.path,
      builder: (_, __) => const LoadingScreen(),
    ),
    GoRoute(path: AboutScreen.path, builder: (_, __) => const AboutScreen()),
    ShellRoute(
      builder: (context, state, child) {
        return DashboardScreen(state: state, child: child);
      },
      routes: [
        GoRoute(
          path: CurrencyView.path,
          builder: (_, __) => const CurrencyView(),
        ),
        GoRoute(path: GoldsView.path, builder: (_, __) => const GoldsView()),
        GoRoute(path: CryptoView.path, builder: (_, __) => const CryptoView()),
      ],
    ),
  ],
);
