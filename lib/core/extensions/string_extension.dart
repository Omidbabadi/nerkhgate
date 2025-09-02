import 'package:flutter/material.dart';
import 'package:myapp/core/common/entities/currency.dart';

extension StringExt on String {
  ThemeMode get stringValueToTheme {
    return switch (toLowerCase()) {
      'light' => ThemeMode.light,
      'dark' => ThemeMode.dark,
      _ => ThemeMode.system,
    };
  }

  bool? get stringValueToBool {
    return switch (toLowerCase()) {
      'true' => true,
      'false' => false,
      _ => null,
    };
  }

  ItemTypes get getItemTypes {
    return switch (toLowerCase()) {
      'gold' => ItemTypes.gold,
      'currency' => ItemTypes.currency,
      _ => ItemTypes.cryptocurrency,
    };
  }
}
