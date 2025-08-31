import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/core/res/styles/colors.dart';
import 'package:myapp/src/crypto/presention/view/crypto_view.dart';
import 'package:myapp/src/currency/presention/views/curreny_view.dart';
import 'package:myapp/src/gold/presention/views/golds_view.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'dart:ui';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});
  final tabs = const [
    {'icon': Icons.money, 'title': "Currency", 'route': CurrencyView.path},
    {'icon': Icons.search, 'title': "Gold", 'route': GoldsView.path},
    {'icon': Icons.person, 'title': "Crypto", 'route': CryptoView.path},
  ];
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
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
        child: SalomonBottomBar(
          backgroundColor: Colours.testtingColor.withAlpha(14),
          currentIndex: currentIndex,
          onTap: (index) {
            context.go(tabs[index]['route'] as String);
          },
          items: tabs
              .map(
                (t) => SalomonBottomBarItem(
                  icon: Icon(t['icon'] as IconData),
                  title: Text(t['title'] as String),
                  selectedColor: Colours.lightThemeSecondaryColor,
                  unselectedColor: Colours.darkThemeSecondaryColor,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
