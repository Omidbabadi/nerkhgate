import 'package:adivery/adivery_ads.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/core/common/application/riverpod/current_theme.dart';
import 'package:myapp/core/res/styles/colors.dart';
import 'package:myapp/core/utils/core_utils.dart';
import 'package:myapp/core/utils/network_constants.dart';

import 'package:myapp/core/widgets/appbar_title.dart';
import 'package:myapp/src/dashboard/presention/utils/dashboard_utils.dart';
import 'package:myapp/src/prices/presention/app/adapter/prices_adapter.dart';
import '../../../../core/widgets/bottom_appbar.dart';
import '../../../about/presentions/views/about_screen.dart';
import '../../../error/presention/views/error_screen.dart';
import '../../../loading/presentions/view/loading_screen.dart';
import '../widgets/bottom_nav_bar.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key, required this.state, required this.child});

  final GoRouterState state;
  final Widget child;

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  IconData _getThemeIcon() {
    final theme = ref.watch(currentThemeProvider);
    return switch (theme) {
      ThemeMode.light => Icons.dark_mode_outlined,
      ThemeMode.dark => Icons.auto_awesome_outlined,
      ThemeMode.system => Icons.light_mode_outlined,
    };
  }

  @override
  Widget build(BuildContext context) {
    final location = widget.state.uri.toString();
    final currentTheme = ref.watch(currentThemeProvider);
    ref.listen(pricesAdapterProvider(), (p, n) {
      if (n is PricesLoading) {
        
        context.push(LoadingScreen.path);
      }
      if (n is PricesError) {
        context.go(ErrorScreen.path);
      }
    });
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.push(AboutScreen.path);
          },
          icon: Icon(
            Icons.info_outline,
            color: CoreUtils.adabtiveColor(
              context,
              lightModeColour: Colours.lightThemePrimaryTextColor,
              darkModeColur: Colours.darkThemePrimaryTextColor,
            ),
          ),
        ),
        actions: [
          IconButton.filled(
            onPressed: () {
              ref.read(currentThemeProvider.notifier).toggleTheme(currentTheme);
            },
            icon: Icon(_getThemeIcon()),
          ),
        ],
        bottom: AppBarBottom(),
        title: AppbarTitle(),
        centerTitle: true,
      ),
      body: Column(
        children: [
          BannerAd(
            NetworkConstants.bannerAdId,
            BannerAdSize.LARGE_BANNER,
            onAdLoaded: (ad) {
              debugPrint('#debug Ad Loaded Successfully');
            },
            onError: (ad, e) {
              debugPrint('#debug Error While Loading Ad: $e');
            },
            onAdClicked: (ad) {
              debugPrint('Ad Clicked');
            },
          ),
          Expanded(child: BottomNavBar.buildIndexStack(location)),
        ],
      ),
      key: DashboardUtils.scaffoldKey,
      bottomNavigationBar: BottomNavBar(location: location),
    );
  }
}
