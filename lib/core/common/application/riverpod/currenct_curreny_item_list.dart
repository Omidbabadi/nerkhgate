import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../entities/currency.dart';

part 'currenct_curreny_item_list.g.dart';

@Riverpod(keepAlive: true)
class CurrenctCurrenyItemList extends _$CurrenctCurrenyItemList {
  @override
  List<Currency>? build() {
    return null;
  }

  void setCurrentList(List<Currency>? list) {
    if (list == null) return;
    state = list.where((i) {
      if(i.itemTypes == ItemTypes.currency) {
        return true;
      }
      return false;
    
    }).toList();
  }
}
