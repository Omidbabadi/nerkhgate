import 'package:myapp/core/common/entities/currency.dart';
import 'package:myapp/core/usecase/usecase.dart';
import 'package:myapp/core/utils/typedefs.dart';
import 'package:myapp/src/prices/domain/repositories/prices_repository.dart';

class GetPricesFromApiUseCase extends UsecaseWithOutParams<List<Currency>> {
  const GetPricesFromApiUseCase(this._repo);
  final PricesRepository _repo;
  @override
  ResultFuture<List<Currency>> call() => _repo.getPricesFromApi();
}
