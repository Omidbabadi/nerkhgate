import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../entities/currency.dart';

part 'current_curreny_list.g.dart';

@Riverpod(keepAlive: true)
class CurrentCurrencyList extends _$CurrentCurrencyList {
  @override
  List<Currency>? build() {
    return null;
  }

  void setCurrentList(List<Currency>? list) {
    if (state != list) state = list;
  }
}
