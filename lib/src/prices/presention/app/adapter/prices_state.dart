part of 'prices_adapter.dart';

sealed class PricesState extends Equatable {
  const PricesState();

  @override
  List<Object?> get props => [];
}

final class PricesInitial extends PricesState {
  const PricesInitial();
}

final class PricesLoading extends PricesState {
  const PricesLoading();
}

final class PriceLoading extends PricesState {
  const PriceLoading();
}

final class PriceLoaded extends PricesState {
  const PriceLoaded(this.price);
  final Currency price;

  @override
  List<Object?> get props => [price];
}

final class PricesLoaded extends PricesState {
  const PricesLoaded(this.prices);
  final List<Currency> prices;

  @override
  List<Object?> get props => prices;
}

final class PricesError extends PricesState {
  const PricesError(this.message);
  final String message;
  @override
  List<Object?> get props => [message];
}
