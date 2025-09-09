import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/core/common/application/riverpod/current_theme.dart';
import 'package:myapp/core/extensions/text_style_extensions.dart';
import 'package:myapp/src/gold/presention/widgets/gold_icon.dart';

import '../common/entities/currency.dart';
import '../res/styles/colors.dart';
import '../res/styles/text.dart';
import '../utils/core_utils.dart';

class ListItems extends ConsumerWidget {
  const ListItems({super.key, required this.item});

  final Currency item;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(currentThemeProvider);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 38,
                  decoration: BoxDecoration(
                    color: CoreUtils.getColorFormPrice(item.changePercent),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6.0,
                    ),
                    child: Text(
                      '${item.price} ${item.unit}',
                      style: TextStyles.paragraphSubTextRegular.copyWith(
                        color: Colours.darkThemePrimaryTextColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                switch (item.itemTypes) {
                  ItemTypes.currency => CoreUtils.getCountryFlag(item.symbol),
                  ItemTypes.cryptocurrency => CoreUtils.getCryptoIcon(
                    item.symbol,
                  ),

                  _ => GoldIcon(name: item.nameFA),
                },
              ],
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  item.nameEN,
                  style: TextStyles.paragraphSubTextRegular.adaptiveColor(
                    context,
                  ),
                ),
                Text(
                  item.nameFA,
                  style: TextStyles.paragraphSubTextRegular.adaptiveColor(
                    context,
                  ),
                ),

                Text(
                  '${item.changeValue}',
                  style: TextStyle(
                    color: Colours.classicAdabtiveTextColor(context),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: SizedBox(
                    height: 12,
                    child: VerticalDivider(
                      radius: BorderRadius.circular(12),
                      color: Colours.darkThemeSecondaryColor,
                      width: 2,
                      thickness: 2,
                    ),
                  ),
                ),
                Text(
                  ' ${item.changePercent}%',
                  style: TextStyle(
                    color: CoreUtils.getColorFormPrice(item.changePercent),
                  ),
                ),
              ],
            ),
            if (item.itemTypes == ItemTypes.cryptocurrency)
              Padding(
                padding: EdgeInsets.fromLTRB(1.0, 10.0, 1.0, 10.0),
                child: Text(
                  item.description!,
                  textAlign: TextAlign.center,
                  style: TextStyles.paragraphSubTextRegular.copyWith(
                    color: Colours.classicAdabtiveTextColor(context),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
