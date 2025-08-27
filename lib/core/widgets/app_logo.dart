import 'package:flutter/material.dart';
import 'package:myapp/core/extensions/text_style_extensions.dart';
import 'package:myapp/core/res/styles/colors.dart';
import 'package:myapp/core/res/styles/text.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.style});
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'F  E',
        style: style ?? TextStyles.appLogo.white,
        children: [
          TextSpan(
            text: '  E',
            style: TextStyle(color: Colours.lightThemeSecondaryColor),
          ),
        ],
      ),
    );
  }
}
