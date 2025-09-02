import 'package:flutter/material.dart';
import 'package:myapp/core/res/styles/colors.dart';
import 'package:myapp/core/res/styles/text.dart';

class GoldIcon extends StatelessWidget {
  const GoldIcon({super.key, required this.name});
  final String? name;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.amber,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(name ?? 'GOLD',style: TextStyles.paragraphSubTextRegular.copyWith(
            color: Colours.lightThemePrimaryTextColor
          ),),
        ),
      ),
    );
  }
}
