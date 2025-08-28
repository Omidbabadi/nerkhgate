import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/core/common/application/cache_helper.dart';
import 'package:myapp/core/res/styles/colors.dart';
import 'package:myapp/core/utils/core_utils.dart';
import 'package:myapp/src/currency/presention/views/home_view.dart';
import 'package:myapp/src/error/presention/views/error_screen.dart';
import 'package:myapp/src/on_boarding/presention/on_boarding_info_section.dart';
import 'package:myapp/src/prices/presention/app/adapter/prices_adapter.dart';

import '../../../../core/services/injection_container.dart';

class OnBoardingView extends ConsumerStatefulWidget {
  const OnBoardingView({super.key});

  @override
  ConsumerState<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends ConsumerState<OnBoardingView> {
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    ref.listen(pricesAdapterProvider(), (p, n) {
      if (!mounted) {
        debugPrint('on boarding unmounted');
        return;
      }
      if (n is PricesLoaded) {
        CoreUtils.postFrameCallback(() => context.go(HomeView.path));
      }
      if (n is PricesLoading) {
        CoreUtils.postFrameCallback(() => context.go('/'));
      }
      if (n is PricesError) {
        CoreUtils.postFrameCallback(() => context.go(ErrorScreen.path));
      }
    });
    debugPrint('on boarding');
    return Scaffold(
      backgroundColor: Colours.lightThemeBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Stack(
            children: [
              PageView(
                controller: pageController,
                children: [
                  OnBoardingInfoSection.first(),
                  OnBoardingInfoSection.secend(),
                ],
              ),
              Positioned(
                bottom: 18,
                left: 50,
                right: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    await sl<CacheHelper>().cacheFirstTimer(false);
                    ref.read(pricesAdapterProvider().notifier).getPrices();
                  },
                  child: const Text('test'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
