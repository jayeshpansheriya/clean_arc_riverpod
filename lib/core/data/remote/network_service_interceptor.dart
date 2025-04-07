import 'package:clean_arc_riverpod/common/dtos/refresh_token_response.dart';
import 'package:clean_arc_riverpod/common/http_status/status_code.dart';
import 'package:clean_arc_riverpod/core/data/local/secure_storage/isecure_storage.dart';
import 'package:clean_arc_riverpod/core/data/local/secure_storage/secure_storage.dart';
import 'package:clean_arc_riverpod/core/data/local/secure_storage/secure_storage_const.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final networkServiceInterceptorProvider =
    Provider.family<NetworkServiceInterceptor, Dio>((ref, dio) {
      final secureStorage = ref.watch(secureStorageProvider);
      return NetworkServiceInterceptor(secureStorage, dio);
    });

final class NetworkServiceInterceptor extends Interceptor {
  final ISecureStorage _secureStorage;
  final Dio _dio;

  const NetworkServiceInterceptor(this._secureStorage, this._dio);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _secureStorage.read(accessTokenKey);
    options.headers['Content-Type'] = 'application/json';
    options.headers['Accept'] = 'application/json';
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == unauthorized) {
      // Handle token expiration or unauthorized access
      // You can refresh the token here or redirect to login
      final refreshToken = await _secureStorage.read(refreshTokenKey);
      try {
        final response = await _refreshToken(_dio, refreshToken);

        final statusCode = response.statusCode;
        if (statusCode == success) {
          final result = RefreshTokenResponse.fromJson(response.data);
          final newAccessToken = result.data.accessToken;
          final newRefreshToken = result.data.refreshToken;
          // Store the new tokens
          await _storeAccessToken(newAccessToken, newRefreshToken);
          // Retry the original request with the new token
          final options = err.requestOptions;
          options.headers['Authorization'] = 'Bearer $newAccessToken';
          // Update the request options with the new token
          final newResponse = await _dio.fetch(options);
          return handler.resolve(newResponse);
        } else {
          // Handle refresh token failure (e.g., redirect to login)
        }
      } on DioException catch (e) {
        if (e.response?.statusCode == refreshTokenExpired) {
          // Handle refresh token failure remove tokens
          await _clearAccessToken();

          return handler.next(err);
        }
        return handler.next(err);
      }
    }
    super.onError(err, handler);
  }

  Future<void> _clearAccessToken() async {
    await _secureStorage.delete(accessTokenKey);
    await _secureStorage.delete(refreshTokenKey);
  }

  Future<void> _storeAccessToken(String accessToken, String refreshTken) async {
    await _secureStorage.write(accessTokenKey, accessToken);
    await _secureStorage.write(refreshTokenKey, refreshTken);
  }

  Future<Response> _refreshToken(Dio dio, String? refreshToken) async {
    final response = await dio.post(
      'https://yourapi.com/refresh-token',
      data: {'refresh_token': refreshToken},
    );
    return response;
  }
}
