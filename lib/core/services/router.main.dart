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
        final cacheHelper = sl<CacheHelper>();
        if (cacheHelper.isFirstTime()) {
          return ProviderScope(child:const OnBoardingView());
        }
        return ProviderScope(child:const SplashScreen());
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
        GoRoute(path: HomeView.path, builder: (_, __) => const HomeView()),
      ],
    ),
  ],
);
