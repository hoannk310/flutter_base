import 'package:dio/dio.dart';
import 'package:flutter_base/src/core/di/interceptor.dart';
import 'package:flutter_base/src/core/network/api_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Dio createApiClient(Ref ref) {
  final dio = Dio(BaseOptions(
    baseUrl: ApiConfig.baseUrl,
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  ));

  dio.interceptors.add(ref.read(authInterceptorProvider));
  // Logging Interceptor
  dio.interceptors.add(LogInterceptor(
    requestBody: true,
    responseBody: true,
  ));
  return dio;
}
