import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:lottie/lottie.dart';
import 'package:myapp/core/common/application/riverpod/current_theme.dart';

import 'package:myapp/core/res/media.dart';
import 'package:myapp/src/prices/presention/app/adapter/prices_adapter.dart';

import '../../../error/presention/views/error_screen.dart';

class LoadingScreen extends ConsumerStatefulWidget {
  const LoadingScreen({super.key});

  static const path = '/loading';

  @override
  ConsumerState<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends ConsumerState<LoadingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _lottieContorller;

  @override
  void initState() {
    super.initState();
    _lottieContorller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _lottieContorller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(currentThemeProvider);
    ref.listen(pricesAdapterProvider(), (p, n) async {
      if (!mounted) {
        return;
      }
      if (n is PricesLoaded) {
        await Future.delayed(const Duration(seconds: 3));
        context.pop();
      }
      if (n is PricesError) {
        context.go(ErrorScreen.path);
      }
    });
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Lottie.asset(
            Media.loading,

            controller: _lottieContorller,
            onLoaded: (composition) {
              _lottieContorller
                ..duration = composition.duration
                ..repeat();
            },
          ),
        ),
      ),
    );
  }
}
