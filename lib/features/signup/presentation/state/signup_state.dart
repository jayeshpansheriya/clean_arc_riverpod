import 'package:clean_arc_riverpod/features/signup/data/dto/signup_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_state.freezed.dart';

@freezed
abstract class SignUpState with _$SignUpState {
  factory SignUpState({
    SignUpResponse? signUpResponse,
    bool? isSignUpSuccess,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _SignUpState;
}
