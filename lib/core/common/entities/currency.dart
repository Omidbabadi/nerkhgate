import 'package:equatable/equatable.dart';

class Currency extends Equatable {
  const Currency({
    required this.date,
    required this.time,
    required this.timeUnix,
    required this.symbol,
    required this.nameEN,
    required this.nameFA,
    required this.price,
    required this.changePercent,
    required this.unit,
    required this.itemTypes,
    this.isFav,
    this.description,
    this.changeValue,
    this.marketCap,
  });

  const Currency.empty()
    : date = 'Test String',
      time = 'Test String',
      timeUnix = 0,
      symbol = 'Test String',
      nameEN = 'Test String',
      nameFA = 'استرینگ تست',
      price = 0,
      changeValue = 0,
      changePercent = 0,
      unit = 'Test String',
      isFav = null,
      description = 'Test String',
      marketCap = 0,
      itemTypes = ItemTypes.gold;

  final String date;
  final String time;
  final double timeUnix;
  final String symbol;
  final String nameEN;
  final String nameFA;
  final double price;
  final double? changeValue;
  final double changePercent;
  final String unit;
  final bool? isFav;
  final String? description;
  final double? marketCap;
  final ItemTypes itemTypes;
  @override
  List<Object?> get props => [symbol, nameEN, nameFA];
}

enum ItemTypes { gold, currency, cryptocurrency }
