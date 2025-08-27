import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/core/common/application/riverpod/currenct_curreny_item_list.dart';
import 'package:myapp/core/common/application/riverpod/current_curreny_list.dart';
import 'package:myapp/core/common/application/riverpod/current_gold_list.dart';
import 'package:myapp/src/prices/presention/app/adapter/prices_adapter.dart';

import '../../../../core/res/styles/colors.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});
  static const path = '/home';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currencies = ref.watch(currenctCurrenyItemListProvider);
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
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colours.darkThemeSecondaryColor,
                  width: 1.0,
                ),
              )
            ),child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                
              ),
            )
          );
        },
      ),
    );
  }
}
