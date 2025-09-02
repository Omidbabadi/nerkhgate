part of 'injection_container.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await _cacheInite();
  //await _tapsellInit();
  await _pricesInit();
}

Future<void> _pricesInit() async {
  sl
    ..registerLazySingleton(() => GetPricesFromApiUseCase(sl()))
    ..registerLazySingleton<PricesRepository>(() => PricesRepositoryImpl(sl()))
    ..registerLazySingleton<PricesRemoteDatasource>(
      () => PricesRemoteDatasoureceImpl(sl()),
    )
    ..registerLazySingleton(http.Client.new);
}

// Future<void> _tapsellInit() async {
//   final tapsell = TapsellPlus.instance;
//   final appId =
//       'pkkojresmqmcfatehpknbebmmjdtrdagepsaphjqljcfifdpqhklolthrrpkbflfsdkgfn';
//   final isInit = await tapsell.initialize(appId);
//   tapsell.setDebugMode(true);
//   print(isInit);
//   sl
//     ..registerLazySingleton(() => AdHelper(sl(), isInit))
//     ..registerLazySingleton(() => tapsell);
// }

Future<void> _cacheInite() async {
  final prefs = await SharedPreferences.getInstance();

  sl
    ..registerLazySingleton(() => CacheHelper(sl()))
    ..registerLazySingleton(() => prefs);
}
