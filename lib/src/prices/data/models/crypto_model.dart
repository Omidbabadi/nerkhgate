import 'dart:convert';
import 'package:myapp/core/utils/typedefs.dart';

import '../../../../core/common/entities/currency.dart';

class CryptoModel extends Currency {
  const CryptoModel({
    required super.date,
    required super.time,
    required super.timeUnix,
    required super.symbol,
    required super.nameEN,
    required super.nameFA,
    required super.price,
    required super.changePercent,
    required super.unit,
    required super.itemTypes,
    super.changeValue,
    super.isFav,
    super.description,
    super.marketCap,
  });

  const CryptoModel.empty()
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
        description: 'Test String',
        marketCap: 0,
        itemTypes: ItemTypes.gold,
      );

  CryptoModel copyWith({
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
    return CryptoModel(
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
      description: description ?? this.description,
      marketCap: marketCap ?? this.marketCap,
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
      "market_cap": marketCap,
      "description": description,
    };
  }

  factory CryptoModel.fromJson(String source) =>
      CryptoModel.fromMap(jsonDecode(source) as DataMap);

  factory CryptoModel.fromMap(DataMap map) {
    

    return CryptoModel(
      date: map['date'] as String,
      time: map['time'] as String,
      timeUnix: (map['time_unix'] as num).toDouble(),
      symbol: map['symbol'] as String,
      nameEN: map['name_en'] as String,
      nameFA: map['name'] as String,
      itemTypes: ItemTypes.cryptocurrency,
      price: double.tryParse((map['price']).toString()) ?? 0.0,
      changePercent: (map['change_percent'] as num).toDouble(),
      unit: map['unit'] as String,
      description: map['description'] as String?,
      marketCap: (map['market_cap'] as num?)?.toDouble() ?? 0.0,
    );
  }
  String toJson() => jsonEncode(toMap());
}
