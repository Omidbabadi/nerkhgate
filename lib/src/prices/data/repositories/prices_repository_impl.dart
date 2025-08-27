import 'package:dartz/dartz.dart';
import 'package:myapp/core/common/entities/currency.dart';
import 'package:myapp/core/errors/exceptions.dart';
import 'package:myapp/core/errors/failures.dart';
import 'package:myapp/core/utils/typedefs.dart';
import 'package:myapp/src/prices/domain/repositories/prices_repository.dart';
import '../datasources/prices_remote_datasource.dart';

class PricesRepositoryImpl implements PricesRepository {
  const PricesRepositoryImpl(this._remoteDataSource);
  final PricesRemoteDatasource _remoteDataSource;

  @override
  ResultFuture<List<Currency>> getPricesFromApi() async {
    try {
      final List<Currency> currencies = await _remoteDataSource
          .getPricesFromApi();
      return Right(currencies);
    } on ServerException catch (e) {
      return Left(
        ServerFailure.fromException(e),
      );
    }
  }
}
