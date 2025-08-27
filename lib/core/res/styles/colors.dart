import 'package:flutter/material.dart';
import 'package:myapp/core/utils/core_utils.dart';

abstract class Colours {
  static const Color lightThemeBackground = Color(0xffFEFCFD);
  static const Color darkThemeBackground = Color(0xff1E2019);

  static const Color lightThemePrimaryColor = Color(0xff363062);
  static const Color darkThemePrimaryColor = Color(0xff392B58);

  static const Color lightThemeSecondaryColor = Color(0xff6247aa);
  static const Color darkThemeSecondaryColor = Color(0xff5C6D70);

  static const Color lightThemePrimaryTextColor = Color(0xff2A2B2A);
  static const Color darkThemePrimaryTextColor = Color(0xffF4F1DE);

  static const Color testtingColor = Color(0xff7251b5);

  static const Color errorColor = Color(0xffEF2D56);

  static const Color succsessColor = Color(0xff397367);

  static const Color warningColor = Color(0xffED7D3A);

  static const Color plusColor = Color(0xff499F68);

  static const Color minusColor = Color(0xffED474A);

  static const Color noChangeColor = Color(0xff5D5E60);

  static Color classicAdabtiveTextColor(BuildContext context) =>
      CoreUtils.adabtiveColor(
        context,
        lightModeColour: lightThemePrimaryTextColor,
        darkModeColur: darkThemePrimaryTextColor,
      );
}
