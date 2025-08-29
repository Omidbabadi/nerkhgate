import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/core/utils/core_utils.dart';
import 'package:myapp/core/widgets/app_logo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/src/currency/presention/views/curreny_view.dart';
import 'package:myapp/src/error/presention/views/error_screen.dart';
import 'package:myapp/src/prices/presention/app/adapter/prices_adapter.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(pricesAdapterProvider().notifier).getPrices();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(pricesAdapterProvider(), (p, n) async {
      if (!mounted) {
        debugPrint('splash unmounted');
        return;
      }

      if (n is PricesLoaded) {
        CoreUtils.postFrameCallback(() => context.go(CurrencyView.path));
      } else if (n is PricesError) {
        CoreUtils.postFrameCallback(() => context.go(ErrorScreen.path));
      }
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [AppLogo(), const SizedBox(height: 12)],
        ),
      ),
    );
  }
}
