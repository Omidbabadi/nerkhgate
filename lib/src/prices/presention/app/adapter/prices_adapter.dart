import 'package:flutter/widgets.dart';
import 'package:myapp/core/common/application/riverpod/currenct_curreny_item_list.dart';
import 'package:myapp/core/common/application/riverpod/current_curreny_list.dart';
import 'package:myapp/core/common/application/riverpod/current_gold_list.dart';
import 'package:myapp/src/prices/domain/usecases/get_prices_from_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/common/entities/currency.dart';
import '../../../../../core/services/injection_container.dart';

part 'prices_adapter.g.dart';

part 'prices_state.dart';

@riverpod
class PricesAdapter extends _$PricesAdapter {
  @override
  PricesState build([GlobalKey? familyKey]) {
    _getPricesFromApiUseCase = sl<GetPricesFromApiUseCase>();
    return const PricesInitial();
  }

  late GetPricesFromApiUseCase _getPricesFromApiUseCase;

  Future<void> getPrices() async {
    state = const PricesLoading();
    final result = await _getPricesFromApiUseCase();
    result.fold(
      (failure) {
        state = PricesError(failure.message);
      },
      (currencies) {
        ref
            .read(currentCurrencyListProvider.notifier)
            .setCurrentList(currencies);
        ref.read(currentGoldListProvider.notifier).setCurrentList(currencies);
        ref
            .read(currenctCurrenyItemListProvider.notifier)
            .setCurrentList(currencies);

        state = PricesLoaded(currencies);
      },
    );
  }
}
