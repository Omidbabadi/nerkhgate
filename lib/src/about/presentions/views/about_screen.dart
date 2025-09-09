import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/core/common/application/riverpod/current_theme.dart';
import 'package:myapp/core/extensions/text_style_extensions.dart';
import 'package:myapp/core/res/media.dart';
import 'package:myapp/core/res/styles/text.dart';

import '../../../../core/res/styles/colors.dart';
import '../../../../core/utils/core_utils.dart';

class AboutScreen extends ConsumerStatefulWidget {
  const AboutScreen({super.key});

  static const path = '/about';

  @override
  ConsumerState<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends ConsumerState<AboutScreen>
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
    ref.watch(currentThemeProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton.filled(
          onPressed: () {
            context.pop();
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: CoreUtils.adabtiveColor(
              context,
              lightModeColour: Colours.lightThemePrimaryTextColor,
              darkModeColur: Colours.darkThemePrimaryTextColor,
            ),
          ),
        ),
        title: const Text('درباره ما'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Lottie.asset(
                Media.about,
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
            Text.rich(
              TextSpan(
                text: 'منبع تمام قیمت ها وبسایت ',
                style: TextStyles.headingSemiBold.copyWith(
                  color: Colours.classicAdabtiveTextColor(context),
                ),
                children: [
                  TextSpan(
                    text: 'brsapi.ir',
                    style: TextStyles.headingSemiBold.orange,
                  ),
                  TextSpan(
                    text: 'میباشد',
                    style: TextStyles.headingSemiBold.copyWith(
                      color: Colours.classicAdabtiveTextColor(context),
                    ),
                  ),
                ],
              ),
            ),
            
            
          ],
        ),
      ),
    );
  }
}
