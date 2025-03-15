import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor({required this.dio, required this.storage});

  final Dio dio;
  final FlutterSecureStorage storage;
  bool isRefreshing = false;
  Completer<void>? refreshCompleter;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = await storage.read(key: 'access_token');
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      if (!isRefreshing) {
        isRefreshing = true;
        refreshCompleter = Completer<void>();
        try {
          await _refreshToken();
          refreshCompleter?.complete();
        } catch (e) {
          refreshCompleter?.completeError(e);
        } finally {
          isRefreshing = false;
        }
      } else {
        await refreshCompleter?.future;
      }
      final retryResponse = await _retryRequest(err.requestOptions);
      return handler.resolve(retryResponse);
    }
    handler.next(err);
  }

  Future<void> _refreshToken() async {
    final refreshToken = await storage.read(key: 'refresh_token');
    if (refreshToken == null) throw Exception('No refresh token available');

    try {
      final response = await dio.post(
        '/auth/refresh',
        data: {'refresh_token': refreshToken},
      );
      final newAccessToken = response.data['access_token'] as String;
      await storage.write(key: 'access_token', value: newAccessToken);
    } catch (e) {
      await storage.deleteAll(); // Clear tokens if refresh fails
      throw Exception('Token refresh failed');
    }
  }

  Future<Response<dynamic>> _retryRequest(RequestOptions requestOptions) async {
    final accessToken = await storage.read(key: 'access_token');
    final options = Options(
      method: requestOptions.method,
      headers: {'Authorization': 'Bearer $accessToken'},
    );
    return dio.request(
      requestOptions.path,
      options: options,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
    );
  }
}
