import 'package:clean_arc_riverpod/features/signup/data/dto/signup_response.dart';

abstract interface class ISignUpRepository {
  Future<SignUpResponse> signUp(Map<String, dynamic> body);
}
