import 'package:clean_arc_riverpod/common/http_status/status_code.dart';
import 'package:clean_arc_riverpod/core/data/remote/token/itoken_service.dart';
import 'package:clean_arc_riverpod/core/data/remote/token/token_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final networkServiceInterceptorProvider =
    Provider.family<NetworkServiceInterceptor, Dio>((ref, dio) {
      final tokenService = ref.watch(tokenServiceProvider(dio));
      return NetworkServiceInterceptor(tokenService, dio);
    });

final class NetworkServiceInterceptor extends Interceptor {
  final ITokenService _tokenService;
  final Dio _dio;

  const NetworkServiceInterceptor(this._tokenService, this._dio);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = await _tokenService.getAccessToken();
    options.headers['Content-Type'] = 'application/json';
    options.headers['Accept'] = 'application/json';
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == unauthorized) {
      // Handle token expiration or unauthorized access
      // You can refresh the token here or redirect to login
      final refreshToken = await _tokenService.getRefreshToken();
      try {
        final result = await _tokenService.refreshToken(refreshToken);

        final newAccessToken = result.data.accessToken;
        final newRefreshToken = result.data.refreshToken;
        // Store the new tokens
        await _tokenService.saveToken(newAccessToken, newRefreshToken);
        // Retry the original request with the new token
        final options = err.requestOptions;
        options.headers['Authorization'] = 'Bearer $newAccessToken';
        // Update the request options with the new token
        final newResponse = await _dio.fetch(options);
        return handler.resolve(newResponse);
      } on DioException catch (e) {
        if (e.response?.statusCode == refreshTokenExpired) {
          // Handle refresh token failure remove tokens
          await _tokenService.clearTokens();

          return handler.next(err);
        }
        return handler.next(err);
      }
    }
    super.onError(err, handler);
  }
}
