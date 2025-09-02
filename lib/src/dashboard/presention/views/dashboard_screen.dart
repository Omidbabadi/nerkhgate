import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/core/widgets/appbar_title.dart';
import 'package:myapp/src/dashboard/presention/utils/dashboard_utils.dart';

import '../../../../core/widgets/bottom_appbar.dart';
import '../widgets/bottom_naav_bar.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key, required this.state, required this.child});

  final GoRouterState state;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final location = state.uri.toString();

    return Scaffold(

      appBar: AppBar(
        bottom: AppBarBottom(),
        title: AppbarTitle(
          
        ),
        centerTitle: true,
      ),
      body: BottomNavBar.buildIndexStack(location),
      key: DashboardUtils.scaffoldKey,
      bottomNavigationBar: BottomNavBar(
        location: location,
      ),
    );
  }
}
