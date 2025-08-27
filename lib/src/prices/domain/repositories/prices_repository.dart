import 'package:myapp/core/utils/typedefs.dart';
import '../../../../core/common/entities/currency.dart';

abstract class PricesRepository {
  const PricesRepository();

  ResultFuture<List<Currency>> getPricesFromApi();
}
