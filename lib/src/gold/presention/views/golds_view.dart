import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/core/common/application/riverpod/current_curreny_list.dart';
import 'package:myapp/core/widgets/list_items.dart';
import 'package:myapp/src/prices/presention/app/adapter/prices_adapter.dart';

import '../../../../core/common/entities/currency.dart';

class GoldsView extends ConsumerWidget {
  const GoldsView({super.key});
  static const path = '/gold';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currencies = ref.watch(currentCurrencyListProvider);
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
    final golds = currencies
        .where((element) => element.itemTypes == ItemTypes.gold)
        .toList();


    return Center(
      child: ListView.builder(
        key: const PageStorageKey<String>("gold"),
        itemCount: golds.length,
        itemBuilder: (context, i) {
          
          final item = golds[i];

          return ListItems(item: item);
        },
      ),
    );
  }
}
