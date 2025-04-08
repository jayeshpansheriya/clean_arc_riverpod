import 'package:clean_arc_riverpod/common/dtos/refresh_token_response.dart';

abstract interface class ITokenService {
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
  Future<void> saveToken(String accessToken, String refreshToken);
  Future<void> clearTokens();
  Future<RefreshTokenResponse> refreshToken(String? refreshToken);
}
