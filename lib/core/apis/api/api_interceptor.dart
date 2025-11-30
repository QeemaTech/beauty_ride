import 'package:beauty_ride/core/storage/secure_storage_service.dart';
import 'package:dio/dio.dart';

import '../links/api_keys.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    String? token = await SecureStorageService.instance.getValue(
      key: ApiKeys.accessToken,
    );
    // String? refreshToken = await SecureStorageService.instance.getValue(
    //   key: ApiKeys.refreshToken,
    // );
    options.headers["Content-Type"] = "application/json";
    options.headers["Authorization"] = "Bearer ${token != null ? token : null}";
    super.onRequest(options, handler);
  }
}
