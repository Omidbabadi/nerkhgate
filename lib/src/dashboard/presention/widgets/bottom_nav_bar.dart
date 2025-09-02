import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/core/res/styles/colors.dart';
import 'package:myapp/src/crypto/presention/view/crypto_view.dart';
import 'package:myapp/src/currency/presention/views/curreny_view.dart';
import 'package:myapp/src/gold/presention/views/golds_view.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../../../core/res/media.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, required this.location});
  final String location;
  static final tabs = [
    {
      'icon': Icon(Icons.money),
      'title': "Currency",
      'route': CurrencyView.path,
      'view': const CurrencyView(),
    },
    {
      'icon': ImageIcon(AssetImage(Media.goldIcon)),
      'title': "Gold",
      'route': GoldsView.path,
      'view': const GoldsView(),
    },
    {
      'icon': Icon(Icons.currency_bitcoin),
      'title': "Crypto",
      'route': CryptoView.path,
      'view': const CryptoView(),
    },
  ];

  static Widget buildIndexStack(String location) {
    int idx = tabs.indexWhere((t) => location.startsWith(t['route'] as String));
    if (idx == -1) idx = 0;
    return IndexedStack(
      index: idx,
      children: tabs.map((t) => t['view'] as Widget).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();

    int currentIndex = tabs.indexWhere(
      (t) => location.startsWith(t['route'] as String),
    );
    if (currentIndex == -1) currentIndex = 0;
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.only(
        topLeft: Radius.circular(8),
        topRight: Radius.circular(8),
      ),
      child: SalomonBottomBar(
        backgroundColor: Colours.testtingColor.withAlpha(14),
        currentIndex: currentIndex,
        onTap: (index) {
          context.go(tabs[index]['route'] as String);
        },
        items: tabs
            .map(
              (t) => SalomonBottomBarItem(
                icon: (t['icon'] as Widget),
                title: Text(
                  t['title'] as String,
                  style: TextStyle(
                    color: Colours.classicAdabtiveTextColor(context),
                  ),
                ),
                selectedColor: Colours.lightThemeSecondaryColor,
                unselectedColor: Colours.darkThemeSecondaryColor,
              ),
            )
            .toList(),
      ),
    );
  }
}
