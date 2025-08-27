import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../entities/currency.dart';

part 'current_crypto_currency_list.g.dart';

@Riverpod(keepAlive: true)
class CurrentCryptoCurrencyList extends _$CurrentCryptoCurrencyList {
  @override
  List<Currency>? build() {
    return null;
  }

  void setCurrentList(List<Currency>? list) {
    if (list == null) return;
    state = list.where((i) {
      if(i.itemTypes == ItemTypes.cryptocurrency) {
        return true;
      }
      return false;
    
    }).toList();
  }
}
