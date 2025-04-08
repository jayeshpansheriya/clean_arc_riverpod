import 'package:clean_arc_riverpod/features/signup/application/signup_service.dart';
import 'package:clean_arc_riverpod/features/signup/presentation/state/signup_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signUpControllerProvider =
    AutoDisposeNotifierProvider<SignUpController, SignUpState>(
      SignUpController.new,
    );

class SignUpController extends AutoDisposeNotifier<SignUpState> {
  @override
  SignUpState build() {
    return SignUpState();
  }

  Future<void> signUp() async {
    try {
      state = state.copyWith(
        isLoading: true,
        errorMessage: null,
        isSignUpSuccess: null,
      );
      final result = await ref.read(signUpServiceProvider).signUp({});
      state = state.copyWith(
        isLoading: false,
        signUpResponse: result,
        isSignUpSuccess: true,
        errorMessage: null,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
        isSignUpSuccess: null,
      );
    }
  }
}
