import 'package:clean_arc_riverpod/features/signup/application/isignup_service.dart';
import 'package:clean_arc_riverpod/features/signup/data/dto/signup_response.dart';
import 'package:clean_arc_riverpod/features/signup/data/repository/isignup_repository.dart';
import 'package:clean_arc_riverpod/features/signup/data/repository/signup_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signUpServiceProvider = Provider.autoDispose<ISignUpService>((ref) {
  final signUpRepository = ref.watch(signupRepositoryProvider);

  return SignUpService(signUpRepository);
});

final class SignUpService implements ISignUpService {
  final ISignUpRepository _signUpRepository;
  SignUpService(this._signUpRepository);

  @override
  Future<SignUpResponse> signUp(Map<String, dynamic> body) async {
    try {
      final response = await _signUpRepository.signUp(body);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
