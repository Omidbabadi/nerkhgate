import 'package:flutter/material.dart';
import 'package:myapp/core/extensions/text_style_extensions.dart';
import 'package:myapp/core/res/styles/colors.dart';
import 'package:myapp/src/prices/data/datasources/prices_remote_datasource.dart';

import '../../../core/res/media.dart';
import '../../../core/res/styles/text.dart';
import 'package:http/http.dart' as http;

class OnBoardingInfoSection extends StatelessWidget {
  const OnBoardingInfoSection.first({super.key}) : first = true;
  const OnBoardingInfoSection.secend({super.key}) : first = false;

  final bool first;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.center,
      children: [
        Image.asset(first ? Media.female : Media.male),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            switch (first) {
              true => Text.rich(
                textAlign: TextAlign.left,
                TextSpan(
                  text: '${DateTime.now().year.toString()}\n',
                  style: TextStyles.headingBold.orange,
                  children: [
                    TextSpan(
                      text: 'Get Latest Prices',
                      style: TextStyle(
                        color: Colours.classicAdabtiveTextColor(context),
                      ),
                    ),
                  ],
                ),
              ),

              false => Text.rich(
                textAlign: TextAlign.left,
                TextSpan(
                  text: 'dollars && gold',
                  style: TextStyles.headingBold.adaptiveColor(context),
                ),
              ),
            },
          ],
        ),
      ],
    );
  }
}
