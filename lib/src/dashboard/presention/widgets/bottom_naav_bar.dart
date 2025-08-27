import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});
 final tabs = const [
      {'icon': Icons.money, 'title': "Home", 'route': '/home'},
      {'icon': Icons.search, 'title': "Search", 'route': '/search'},
      {'icon': Icons.person, 'title': "Profile", 'route': '/profile'},
    ];
  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();

      int currentIndex = tabs.indexWhere((t) => location.startsWith(t['route'] as String));
    if (currentIndex == -1) currentIndex = 0;
    return SalomonBottomBar(
      currentIndex: currentIndex,
      onTap: (index) {
        context.go(tabs[index]['route'] as String);
      },
      items: tabs
          .map(
            (t) => SalomonBottomBarItem(
              icon: Icon(t['icon'] as IconData),
              title: Text(t['title'] as String),
              selectedColor: Colors.blue,
            ),
          )
          .toList(),
    );
  }
}
