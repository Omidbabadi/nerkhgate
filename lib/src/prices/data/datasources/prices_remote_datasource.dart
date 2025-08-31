import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:myapp/core/common/entities/currency.dart';
import 'package:myapp/core/errors/exceptions.dart';
import 'package:myapp/core/utils/error_response.dart';
import 'package:myapp/core/utils/network_constants.dart';
import 'package:myapp/core/utils/typedefs.dart';
import 'package:myapp/src/prices/data/models/currency_model.dart';
import 'package:http/http.dart' as http;

abstract class PricesRemoteDatasource {
  const PricesRemoteDatasource();

  Future<Currencies> getPricesFromApi();
}

class PricesRemoteDatasoureceImpl implements PricesRemoteDatasource {
  const PricesRemoteDatasoureceImpl(this._client);
  final http.Client _client;

  @override
  Future<Currencies> getPricesFromApi() async {
    try {
      final uri = Uri.parse(
        '${NetworkConstants.baseUrl}${NetworkConstants.apiKey}',
      );
      final response = await _client.get(uri);
      final payload = jsonDecode(response.body) as DataMap;
      if (response.statusCode != 200) {
        final errorRespone = ErrorResponse.fromMap(payload);
        throw ServerException(
          message: errorRespone.errorMessage,
          statusCode: response.statusCode,
        );
      }
      final Currencies golds =
          (payload['gold'] as List? )?.map((item) {
            return CurrencyModel.fromMap(item, ItemTypes.gold);
          }).toList() ?? [];

           final Currencies currencies =
          (payload['currency'] as List? )?.map((item) {
            
            return CurrencyModel.fromMap(item, ItemTypes.currency);
          }).toList() ?? [];

           final Currencies cryptoCurrencies =
          (payload['cryptocurrency'] as List? )?.map((item) {
            return CurrencyModel.fromMap(item, ItemTypes.cryptocurrency);
          }).toList() ?? [];

      final Currencies combiedList = golds + currencies + cryptoCurrencies;

      return combiedList;
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      throw const ServerException(
        message: 'there was an error ',
        statusCode: 500,
      );
    }
  }
}
