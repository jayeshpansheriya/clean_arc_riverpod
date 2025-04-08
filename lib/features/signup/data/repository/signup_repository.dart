import 'package:clean_arc_riverpod/common/exception/failure.dart';
import 'package:clean_arc_riverpod/common/mixin/dio_exception_mapper.dart';
import 'package:clean_arc_riverpod/features/signup/data/dto/signup_response.dart';
import 'package:clean_arc_riverpod/features/signup/data/repository/isignup_repository.dart';
import 'package:clean_arc_riverpod/features/signup/data/source/remote/signup_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signupRepositoryProvider = Provider<ISignUpRepository>((ref) {
  final signUpApi = ref.watch(signUpApiProvider);
  return SignupRepository(signUpApi);
});

final class SignupRepository
    with DioExceptionMapper
    implements ISignUpRepository {
  final SignUpApi _signUpApi;
  SignupRepository(this._signUpApi);

  @override
  Future<SignUpResponse> signUp(Map<String, dynamic> body) async {
    try {
      final response = await _signUpApi.signup(body);
      return response;
    } on DioException catch (e, s) {
      throw mapDioExceptionToFailure(e, s);
    } catch (e, s) {
      throw Failure(
        message: "An unexpected error occurred",
        exception: e as Exception,
        stackTrace: s,
      );
    }
  }
}
