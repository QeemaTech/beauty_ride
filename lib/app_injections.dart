import 'package:beauty_ride/core/apis/api/api_services.dart';
import 'package:beauty_ride/core/apis/api/dio_services.dart';
import 'package:beauty_ride/core/classes/my_logger.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

GetIt sl = GetIt.instance;

Future<void> appInjections() async {
  //* apis && network
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<http.Client>(() => http.Client());
  sl.registerLazySingleton(() => Connectivity());
  sl.registerLazySingleton<ApiServices>(() => DioServices(dio: sl.call()));
  // sl.registerLazySingleton<PrefServices>(() => PrefServices.instance);
  // sl.registerLazySingleton<SecureStorageService>(
  //   () => SecureStorageService.instance,
  // );

  try {
    final box = await Hive.openBox("myBox");
    sl.registerLazySingleton(() => box);
  } catch (e) {
    MyLogger.instance.printLog("Hive openBox error: $e");
  }
}
