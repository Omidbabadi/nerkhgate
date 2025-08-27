import 'dart:convert';

import 'package:myapp/core/common/entities/currency.dart';

import '../../../../core/utils/typedefs.dart';

class GoldModel extends Currency {
 const GoldModel({
    required super.date,
    required super.time,
    required super.timeUnix,
    required super.symbol,
    required super.nameEN,
    required super.nameFA,
    required super.price,
    required super.changeValue,
    required super.changePercent,
    required super.unit,
    required super.itemTypes,
    super.isFav,
  });

  const GoldModel.empty()
    : this(
        date: 'Test String',
        time: 'Test String',
        timeUnix: 0,
        symbol: 'Test String',
        nameEN: 'Test String',
        nameFA: 'Test String',
        price: 0,
        changeValue: 0,
        changePercent: 0,
        unit: 'Test String',
        isFav: null,
        itemTypes: ItemTypes.gold,
      );

  GoldModel copyWith({
    String? date,
    String? time,
    double? timeUnix,
    String? symbol,
    String? nameEN,
    String? nameFA,
    double? price,
    double? changeValue,
    double? changePercent,
    String? unit,
    bool? isFav,
    String? description,
    double? marketCap,
    ItemTypes? itemTypes,
  }) {
    return GoldModel(
      date: date ?? this.date,
      time: time ?? this.time,
      timeUnix: timeUnix ?? this.timeUnix,
      symbol: symbol ?? this.symbol,
      nameEN: nameEN ?? this.nameEN,
      nameFA: nameFA ?? this.nameFA,
      price: price ?? this.price,
      changeValue: changeValue ?? this.changeValue,
      changePercent: changePercent ?? this.changePercent,
      unit: unit ?? this.unit,
      isFav: isFav ?? this.isFav,
      itemTypes: itemTypes ?? this.itemTypes,
    );
  }

  double parseTodouble(dynamic value) {
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? 0;
    return value;
  }

  DataMap toMap() {
    return {
      "date": date,
      "time": time,
      "time_unix": timeUnix,
      "symbol": symbol,
      "name_en": nameEN,
      "name": nameFA,
      "price": price,
      "change_value": changeValue,
      "change_percent": changePercent,
      "unit": unit,      
    };
  }

  factory GoldModel.fromJson(String source) =>
      GoldModel.fromMap(jsonDecode(source) as DataMap);
  factory GoldModel.fromMap(DataMap map) {
    return GoldModel(
      date: map['date'] as String,
      time: map['time'] as String,
      timeUnix: (map['time_unix'] as num).toDouble(),
      symbol: map['symbol'] as String,
      nameEN: map['name_en'] as String,
      nameFA: map['name'] as String,
      itemTypes: ItemTypes.gold,
      price: double.tryParse((map['price']).toString()) ?? 0.0,
      changeValue: (map['change_value'] as num?)?.toDouble() ?? 0.0,
      changePercent: (map['change_percent'] as num).toDouble(),
      unit: map['unit'] as String,
    );
  }
  String toJson() => jsonEncode(toMap());
}
