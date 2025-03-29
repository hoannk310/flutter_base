import 'package:dio/dio.dart';
import 'package:flutter_base/src/core/common/token_manager/token_manager.dart';
import 'package:flutter_base/src/core/di/network.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_base/src/core/network/api_config.dart';

class AuthInterceptor extends Interceptor {
  final Ref ref;
  bool _isRefreshing = false;
  final List<RequestOptions> _retryQueue = [];

  AuthInterceptor(this.ref);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.extra['isRefreshingToken'] == true) {
      handler.next(options);
      return;
    }

    final token = await ref.read(tokenManagerProvider).getAccessToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      if (err.requestOptions.extra['retried'] == true) {
        handler.reject(err);
        return;
      }

      _retryQueue.add(err.requestOptions..extra['retried'] = true);

      if (!_isRefreshing) {
        _isRefreshing = true;
        bool refreshSuccess = await _refreshToken();
        _isRefreshing = false;

        if (refreshSuccess) {
          await _retryFailedRequests(handler);
        } else {
          _rejectAllRequests(handler);
        }
      }
      return;
    }
    handler.next(err);
  }

  Future<bool> _refreshToken() async {
    final refreshToken = await ref.read(tokenManagerProvider).getRefreshToken();
    if (refreshToken == null) return false;

    try {
      final response = await ref.read(dioProvider).post(
            '${ApiConfig.baseUrl}/auth/refresh-token',
            data: {'refreshToken': refreshToken},
            options: Options(extra: {'isRefreshingToken': true}),
          );

      if (response.statusCode == 200) {
        final newAccessToken = response.data['accessToken'];
        final newRefreshToken = response.data['refreshToken'];

        await ref.read(tokenManagerProvider).saveToken(
            accessToken: newAccessToken, refreshToken: newRefreshToken);
        return true;
      }
    } catch (e) {
      return false;
    }
    return false;
  }

  Future<void> _retryFailedRequests(ErrorInterceptorHandler handler) async {
    final token = await ref.read(tokenManagerProvider).getAccessToken();
    while (_retryQueue.isNotEmpty) {
      final retryRequest = _retryQueue.removeAt(0);
      retryRequest.headers['Authorization'] = 'Bearer $token';

      try {
        final response = await ref.read(dioProvider).fetch(retryRequest);
        if (response.statusCode == 401) {
          continue;
        }
        handler.resolve(response);
      } catch (e) {
        handler.reject(DioException(
          requestOptions: retryRequest,
          response: (e is DioException)
              ? e.response
              : Response(requestOptions: retryRequest, statusCode: 401),
        ));
      }
    }
  }

  void _rejectAllRequests(ErrorInterceptorHandler handler) {
    while (_retryQueue.isNotEmpty) {
      final request = _retryQueue.removeAt(0);
      handler.reject(DioException(
        requestOptions: request,
        response: Response(requestOptions: request, statusCode: 401),
      ));
    }
  }
}
