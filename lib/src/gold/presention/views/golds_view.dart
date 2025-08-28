import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/core/common/application/riverpod/currenct_curreny_item_list.dart';
import 'package:myapp/core/common/application/riverpod/current_gold_list.dart';
import 'package:myapp/core/res/styles/text.dart';
import 'package:myapp/src/prices/presention/app/adapter/prices_adapter.dart';

import '../../../../core/common/entities/currency.dart';
import '../../../../core/res/styles/colors.dart';

class GoldsView extends ConsumerWidget {
  const GoldsView({super.key});
  static const path = '/gold';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final testing = [
      Currency.empty(),
      Currency.empty(),
      Currency.empty(),
      Currency.empty(),
    ];
    final currencies = ref.watch(currentGoldListProvider);
    if (currencies == null) {
      return Center(
        child: ElevatedButton(
          onPressed: () {
            ref.read(pricesAdapterProvider().notifier).getPrices();
          },
          child: Text('Get Prices'),
        ),
      );
    }
    return Center(
      child: ListView.builder(
        itemCount: currencies.length,
        itemBuilder: (context, i) {
          final item = currencies[i];
          final Color changeColor = item.changeValue! > 0
              ? Colours.plusColor
              : item.changeValue! < 0
              ? Colours.minusColor
              : Colours.noChangeColor;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colours.darkThemeSecondaryColor,
                    width: 0.5,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: changeColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6.0,
                          ),
                          child: Text(
                            '${item.price} ${item.unit}',
                            style: TextStyles.headingSemiBold1,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        item.symbol,
                        style: TextStyles.paragraphSubTextRegular3,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(item.nameEN, style: TextStyles.paragraphSubTextRegular),
                  const SizedBox(height: 8),
                  Text(item.nameFA, style: TextStyles.paragraphSubTextRegular),

                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text('${item.changeValue}'),
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
                      Text(' ${item.changePercent}'),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
