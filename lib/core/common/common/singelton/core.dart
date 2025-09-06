import 'package:flutter/material.dart';

class Cache {
  Cache._internal();

  static final Cache instance = Cache._internal();
  List<String>? _favCurrency;
  String? _lastPrices;
  final themeModeNotifier = ValueNotifier(ThemeMode.system);

  List<String>? get favCurrency => _favCurrency;

  String? get lastPrices => _lastPrices;

  void setFavCurrency(List<String>? favList) {
    _favCurrency = favList;
  }

  void setLastPrices(String? newlastPrices) {
    _lastPrices = newlastPrices;
  }

  void setThemeMode(ThemeMode themeMode) {
    themeModeNotifier.value = themeMode;
  }

  void reset() {
    setLastPrices(null);
    setFavCurrency(null);
  }
}
