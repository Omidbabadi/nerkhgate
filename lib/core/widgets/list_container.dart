import 'package:flutter/material.dart';
import 'package:myapp/core/extensions/text_style_extensions.dart';
import 'package:myapp/core/res/styles/colors.dart';
import 'package:myapp/core/res/styles/text.dart';
import 'package:myapp/core/utils/core_utils.dart';

import '../../src/prices/data/models/currency_model.dart';
import '../utils/typedefs.dart';

class ListContainer extends StatelessWidget {
  const ListContainer({
    super.key,
    required this.headlineText,
    required this.pinnedCurrencies,
  });
  final String headlineText;
  final List<Widget> pinnedCurrencies;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 285,
        decoration: BoxDecoration(
          color: CoreUtils.adabtiveColor(
            context,
            lightModeColour: Colours.lightThemeBackground,
            darkModeColur: Colours.darkThemeBackground,
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colours.classicAdabtiveTextColor(context),
            width: 1,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0, // or bottom: 0
              left: 0,
              right: 0,
              height: 40, // specific height to colorize
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  color: CoreUtils.adabtiveColor(
                    context,
                    lightModeColour: Colours.lightThemePrimaryColor,
                    darkModeColur: Colours.darkThemePrimaryColor,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        headlineText,
                        style: TextStyles.headingSemiBold1.white,
                      ),
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(99),
                          color: Colours.lightThemeBackground,
                        ),
                        child: GestureDetector(
                          child: Icon(
                            Icons.navigate_next,
                            color: Colours.lightThemePrimaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 40,
              left: 0,
              right: 0,
              child: Column(spacing: 5, children: pinnedCurrencies),
            ),
          ],
        ),
      ),
    );
  }
}

final Currencies testing = [
  CurrencyModel.empty(),
  CurrencyModel.empty(),
  CurrencyModel.empty(),
  CurrencyModel.empty(),
];
