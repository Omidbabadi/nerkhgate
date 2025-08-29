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

        return ProviderScope(child: const SplashScreen());
      },
    ),
    GoRoute(
      path: ErrorScreen.path,
      builder: (_, __) => ProviderScope(child: const ErrorScreen()),
    ),
    ShellRoute(
      builder: (context, state, child) {
        return ProviderScope(
          child: DashboardScreen(state: state, child: child),
        );
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
