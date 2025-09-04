import 'package:adivery/adivery_ads.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/core/utils/network_constants.dart';

import 'package:myapp/core/widgets/appbar_title.dart';
import 'package:myapp/src/dashboard/presention/utils/dashboard_utils.dart';
import '../../../../core/widgets/bottom_appbar.dart';
import '../widgets/bottom_nav_bar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key, required this.state, required this.child});

  final GoRouterState state;
  final Widget child;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var isAdLoaded = false;

  @override
  Widget build(BuildContext context) {
    final location = widget.state.uri.toString();

    return Scaffold(
      appBar: AppBar(
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
