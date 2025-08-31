import 'package:flutter/material.dart';

import '../common/entities/currency.dart';
import '../res/styles/colors.dart';
import '../res/styles/text.dart';
import '../utils/core_utils.dart';

class ListItems extends StatelessWidget {
  const ListItems({super.key, required this.item});

  final Currency item;
  @override
  Widget build(BuildContext context) {
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
                  height: 32,
                  decoration: BoxDecoration(
                    color: CoreUtils.getColorFormPrice(
                      item.changeValue ?? item.changePercent,
                    ),
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
                  ItemTypes.cryptocurrency => Icon(
                    CoreUtils.getCryptoIcon(item.symbol) ??
                        Icons.currency_bitcoin,
                  ),
                  _ => Text('GOLD'),
                },
              ],
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  item.nameEN,
                  style: TextStyles.paragraphSubTextRegular.copyWith(
                    color: Colours.classicAdabtiveTextColor(context),
                  ),
                ),
                Text(
                  item.nameFA,
                  style: TextStyles.paragraphSubTextRegular.copyWith(
                    color: Colours.classicAdabtiveTextColor(context),
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
                    color: Colours.classicAdabtiveTextColor(context),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
