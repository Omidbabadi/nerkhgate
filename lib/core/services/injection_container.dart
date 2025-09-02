import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/core/common/application/ad_helper.dart';
import 'package:myapp/core/common/application/cache_helper.dart';
import 'package:myapp/src/prices/data/datasources/prices_remote_datasource.dart';
import 'package:myapp/src/prices/data/repositories/prices_repository_impl.dart';
import 'package:myapp/src/prices/domain/repositories/prices_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tapsell_plus/tapsell_plus.dart';

import '../../src/prices/domain/usecases/get_prices_from_api.dart';
part 'injection_container.main.dart';