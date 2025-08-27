import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../entities/currency.dart';

part 'current_gold_list.g.dart';

@Riverpod(keepAlive: true)
class CurrentGoldList extends _$CurrentGoldList {
  @override
  List<Currency>? build() {
    return null;
  }

  void setCurrentList(List<Currency>? list) {
    if (list == null) return;
    state = list.where((i) {
      if(i.itemTypes == ItemTypes.gold) {
        return true;
      }
      return false;
    
    }).toList();
  }
}
