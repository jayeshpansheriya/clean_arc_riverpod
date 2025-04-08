import 'package:clean_arc_riverpod/common/dtos/refresh_token_response.dart';
import 'package:clean_arc_riverpod/common/http_status/status_code.dart';
import 'package:clean_arc_riverpod/core/data/local/secure_storage/isecure_storage.dart';
import 'package:clean_arc_riverpod/core/data/local/secure_storage/secure_storage.dart';
import 'package:clean_arc_riverpod/core/data/local/secure_storage/secure_storage_const.dart';
import 'package:clean_arc_riverpod/core/data/remote/token/itoken_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tokenServiceProvider = Provider.family<ITokenService, Dio>((ref, dio) {
  final secureStorage = ref.watch(secureStorageProvider);
  return TokenService(secureStorage, dio);
});

class TokenService implements ITokenService {
  final ISecureStorage _secureStorage;
  final Dio _dio;
  const TokenService(this._secureStorage, this._dio);

  @override
  Future<void> clearTokens() {
    return Future.wait([
      _secureStorage.delete(accessTokenKey),
      _secureStorage.delete(refreshTokenKey),
    ]);
  }

  @override
  Future<String?> getAccessToken() => _secureStorage.read(accessTokenKey);

  @override
  Future<String?> getRefreshToken() => _secureStorage.read(refreshTokenKey);

  @override
  Future<RefreshTokenResponse> refreshToken(String? refreshToken) async {
    final response = await _dio.post(
      'https://yourapi.com/refresh-token',
      data: {'refresh_token': refreshToken},
    );
    if (response.statusCode == success) {
      final result = RefreshTokenResponse.fromJson(response.data);
      return result;
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  @override
  Future<void> saveToken(String accessToken, String refreshToken) {
    return Future.wait([
      _secureStorage.write(accessTokenKey, accessToken),
      _secureStorage.write(refreshTokenKey, refreshToken),
    ]);
  }
}
