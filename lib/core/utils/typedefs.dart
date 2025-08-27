import 'package:dartz/dartz.dart';
import 'package:myapp/core/errors/failures.dart';
import 'package:myapp/src/prices/data/models/currency_model.dart';

typedef DataMap = Map<String, dynamic>;

typedef Currencies = List<CurrencyModel>;

typedef ResultFuture<T> = Future<Either<Failure, T>>;
