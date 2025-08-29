import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/core/res/media.dart';
import 'package:myapp/core/res/styles/text.dart';
import 'package:myapp/core/utils/core_utils.dart';
import 'package:myapp/src/currency/presention/views/curreny_view.dart';
import 'package:myapp/src/prices/presention/app/adapter/prices_adapter.dart';

class ErrorScreen extends ConsumerStatefulWidget {
  const ErrorScreen({super.key});

  static const path = '/error';

  @override
  ConsumerState<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends ConsumerState<ErrorScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _lottieContorller;

  @override
  void initState() {
    super.initState();
    _lottieContorller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 120),
    );
    _lottieContorller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _lottieContorller.stop();
      }
    });
  }

  @override
  void dispose() {
    _lottieContorller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(pricesAdapterProvider());
    ref.listen(pricesAdapterProvider(), (p, n) {
      debugPrint('${state is PricesError}');
      if (!mounted) {
        debugPrint('error unmounted');
        return;
      }

      if (n is PricesLoaded) {
        CoreUtils.postFrameCallback(() => context.go(CurrencyView.path));
      } else if (n is PricesError) {
        _lottieContorller.reset();
        _lottieContorller.forward();
        debugPrint(n.message);
        return;
      }
    });
    return Scaffold(
      floatingActionButton: FilledButton(
        onPressed: () {
          CoreUtils.postFrameCallback(() => context.go(CurrencyView.path));

          // ref.read(pricesAdapterProvider().notifier).getPrices();
        },
        child: state is PricesLoading
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator(color: Colors.white),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  'Retry',
                  style: TextStyles.buttonTextHeadingSemiBold,
                ),
              ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Lottie.asset(
                Media.error,
                height: 300,
                width: 300,
                controller: _lottieContorller,
                onLoaded: (composition) {
                  _lottieContorller
                    ..duration = composition.duration
                    ..forward();
                },
              ),
            ),
            const SizedBox(height: 32),
            Text(
              state is PricesLoading
                  ? 'Please Wait were trying againg'
                  : 'Error: error while getting prices',
              style: TextStyles.headingSemiBold,
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
