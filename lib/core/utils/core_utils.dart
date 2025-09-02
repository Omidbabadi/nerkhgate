import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:myapp/core/extensions/context_extension.dart';
import '../res/media.dart';
import '../res/styles/colors.dart';

abstract class CoreUtils {
  const CoreUtils();

  static void postFrameCallback(VoidCallback callback) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }

  static Color adabtiveColor(
    BuildContext context, {
    required Color lightModeColour,
    required Color darkModeColur,
  }) {
    return context.isDarkMode ? darkModeColur : lightModeColour;
  }

  static CountryFlag getCountryFlag(String currencyCode) {
    return CountryFlag.fromCurrencyCode(
      currencyCode.toUpperCase(),
      shape: const RoundedRectangle(8),
      height: 32,
    );
  }

  static Widget getCryptoIcon(String symbol) {
    return CryptoIcon(cryptoCode: symbol.toUpperCase());
  }

  static Color getColorFormPrice(double price) {
    return price > 0
        ? Colours.plusColor
        : price < 0
        ? Colours.minusColor
        : Colours.noChangeColor;
  }
}
