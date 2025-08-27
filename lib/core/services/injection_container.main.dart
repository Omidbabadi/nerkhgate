part of 'injection_container.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await _cacheInite();
  await _pricesInit();
}

Future<void> _pricesInit() async {
  sl
    ..registerLazySingleton(() => GetPricesFromApiUseCase(sl()))
    ..registerLazySingleton<PricesRepository>(() => PricesRepositoryImpl(sl()))
    ..registerLazySingleton<PricesRemoteDatasource>(() => PricesRemoteDatasoureceImpl(sl()))
    ..registerLazySingleton(http.Client.new)
    ;

}

Future<void> _cacheInite() async {
  final prefs = await SharedPreferences.getInstance();

  sl
    ..registerLazySingleton(() => CacheHelper(sl()))
    ..registerLazySingleton(() => prefs);
}
