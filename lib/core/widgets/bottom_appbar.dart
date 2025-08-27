import 'package:flutter/material.dart';
import 'package:myapp/core/res/styles/colors.dart';
import 'package:myapp/core/utils/core_utils.dart';

class AppBarBottom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: ColoredBox(
        color: CoreUtils.adabtiveColor(
          context,
          lightModeColour: Colours.darkThemeSecondaryColor,
          darkModeColur: Colors.white,
        ),
        child: const SizedBox(width: double.infinity, height: 1),
      ),
    );
  }

  @override
  Size get preferredSize => Size.zero;
}
