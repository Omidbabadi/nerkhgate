import 'package:flutter/material.dart';
import 'package:myapp/core/extensions/string_extension.dart';
import '../../extensions/theme_mode_extension.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common.singelton/core.dart';

class CacheHelper {
  const CacheHelper(this._pref);
  final SharedPreferences _pref;

  static const _lastPricesKey = 'last_prices_key';
  static const _themeModeKey = 'theme_mode_key';
  static const _firstTimer = 'first_timer';
  static const _favCurrency = 'fav_currency';

  Future<bool> cacheFavCurrency(List<String> fav) async {
    try {
      final result = await _pref.setStringList(_favCurrency, fav);
      return result;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> cacheFirstTimer(bool isFirstTimer) async {
    await _pref.setBool(_firstTimer, isFirstTimer);
        
  }

  Future<bool> cachePricesJson(String priceJson) async {
    try {
      final result = await _pref.setString(_lastPricesKey, priceJson);
      Cache.instance.setLastPrices(priceJson);
      return result;
    } catch (e) {
      return false;
    }
  }

  Future<void> cacheThemeMode(ThemeMode themeMode) async {
    await _pref.setString(_themeModeKey, themeMode.themeStringValue);
    Cache.instance.setThemeMode(themeMode);
  }

  List<String> getFavCurrency() {
    final fav = _pref.getStringList(_favCurrency);
    return fav ?? [];
  }

  String? getLastPrices() {
    final lastPrices = _pref.getString(_lastPricesKey);
    return lastPrices;
  }

  bool isFirstTime() => _pref.getBool(_firstTimer) ?? true;

  ThemeMode getThemeMode() {
    final themeModeStringValue = _pref.getString(_themeModeKey);
    final themeMode =
        themeModeStringValue?.stringValueToTheme ?? ThemeMode.system;
    Cache.instance.setThemeMode(themeMode);
    return themeMode;
  }

  Future<void> clearCache() async {
    await _pref.remove(_firstTimer);
    await _pref.remove(_lastPricesKey);
    await _pref.remove(_favCurrency);
    Cache.instance.reset();
  }
}
