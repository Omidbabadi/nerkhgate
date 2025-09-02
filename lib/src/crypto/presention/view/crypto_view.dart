import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/core/common/application/riverpod/current_curreny_list.dart';
import 'package:myapp/core/widgets/list_items.dart';
import 'package:myapp/src/prices/presention/app/adapter/prices_adapter.dart';

import '../../../../core/common/entities/currency.dart';

class CryptoView extends ConsumerWidget {
  const CryptoView({super.key});
  static const path = '/crypto';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allCurrencies = ref.watch(currentCurrencyListProvider);
    if (allCurrencies == null) {
      return Center(
        child: ElevatedButton(
          onPressed: () {
            ref.read(pricesAdapterProvider().notifier).getPrices();
          },
          child: Text('Get Prices'),
        ),
      );
    } else {
      final list = allCurrencies
          .where((item) => item.itemTypes == ItemTypes.cryptocurrency)
          .toList();
      return Center(
        child: ListView.builder(
          key:PageStorageKey<String>("crypto"),
          itemCount: list.length,
          itemBuilder: (context, i) {
            final item = list[i];

            return ListItems(item: item);
          },
        ),
      );
    }
  }
}
