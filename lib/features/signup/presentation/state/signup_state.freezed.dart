// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SignUpState {

 SignUpResponse? get signUpResponse; bool? get isSignUpSuccess; bool get isLoading; String? get errorMessage;
/// Create a copy of SignUpState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignUpStateCopyWith<SignUpState> get copyWith => _$SignUpStateCopyWithImpl<SignUpState>(this as SignUpState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignUpState&&(identical(other.signUpResponse, signUpResponse) || other.signUpResponse == signUpResponse)&&(identical(other.isSignUpSuccess, isSignUpSuccess) || other.isSignUpSuccess == isSignUpSuccess)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,signUpResponse,isSignUpSuccess,isLoading,errorMessage);

@override
String toString() {
  return 'SignUpState(signUpResponse: $signUpResponse, isSignUpSuccess: $isSignUpSuccess, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $SignUpStateCopyWith<$Res>  {
  factory $SignUpStateCopyWith(SignUpState value, $Res Function(SignUpState) _then) = _$SignUpStateCopyWithImpl;
@useResult
$Res call({
 SignUpResponse? signUpResponse, bool? isSignUpSuccess, bool isLoading, String? errorMessage
});


$SignUpResponseCopyWith<$Res>? get signUpResponse;

}
/// @nodoc
class _$SignUpStateCopyWithImpl<$Res>
    implements $SignUpStateCopyWith<$Res> {
  _$SignUpStateCopyWithImpl(this._self, this._then);

  final SignUpState _self;
  final $Res Function(SignUpState) _then;

/// Create a copy of SignUpState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? signUpResponse = freezed,Object? isSignUpSuccess = freezed,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
signUpResponse: freezed == signUpResponse ? _self.signUpResponse : signUpResponse // ignore: cast_nullable_to_non_nullable
as SignUpResponse?,isSignUpSuccess: freezed == isSignUpSuccess ? _self.isSignUpSuccess : isSignUpSuccess // ignore: cast_nullable_to_non_nullable
as bool?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of SignUpState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SignUpResponseCopyWith<$Res>? get signUpResponse {
    if (_self.signUpResponse == null) {
    return null;
  }

  return $SignUpResponseCopyWith<$Res>(_self.signUpResponse!, (value) {
    return _then(_self.copyWith(signUpResponse: value));
  });
}
}


/// @nodoc


class _SignUpState implements SignUpState {
   _SignUpState({this.signUpResponse, this.isSignUpSuccess, this.isLoading = false, this.errorMessage});
  

@override final  SignUpResponse? signUpResponse;
@override final  bool? isSignUpSuccess;
@override@JsonKey() final  bool isLoading;
@override final  String? errorMessage;

/// Create a copy of SignUpState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignUpStateCopyWith<_SignUpState> get copyWith => __$SignUpStateCopyWithImpl<_SignUpState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignUpState&&(identical(other.signUpResponse, signUpResponse) || other.signUpResponse == signUpResponse)&&(identical(other.isSignUpSuccess, isSignUpSuccess) || other.isSignUpSuccess == isSignUpSuccess)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,signUpResponse,isSignUpSuccess,isLoading,errorMessage);

@override
String toString() {
  return 'SignUpState(signUpResponse: $signUpResponse, isSignUpSuccess: $isSignUpSuccess, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$SignUpStateCopyWith<$Res> implements $SignUpStateCopyWith<$Res> {
  factory _$SignUpStateCopyWith(_SignUpState value, $Res Function(_SignUpState) _then) = __$SignUpStateCopyWithImpl;
@override @useResult
$Res call({
 SignUpResponse? signUpResponse, bool? isSignUpSuccess, bool isLoading, String? errorMessage
});


@override $SignUpResponseCopyWith<$Res>? get signUpResponse;

}
/// @nodoc
class __$SignUpStateCopyWithImpl<$Res>
    implements _$SignUpStateCopyWith<$Res> {
  __$SignUpStateCopyWithImpl(this._self, this._then);

  final _SignUpState _self;
  final $Res Function(_SignUpState) _then;

/// Create a copy of SignUpState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? signUpResponse = freezed,Object? isSignUpSuccess = freezed,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_SignUpState(
signUpResponse: freezed == signUpResponse ? _self.signUpResponse : signUpResponse // ignore: cast_nullable_to_non_nullable
as SignUpResponse?,isSignUpSuccess: freezed == isSignUpSuccess ? _self.isSignUpSuccess : isSignUpSuccess // ignore: cast_nullable_to_non_nullable
as bool?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of SignUpState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SignUpResponseCopyWith<$Res>? get signUpResponse {
    if (_self.signUpResponse == null) {
    return null;
  }

  return $SignUpResponseCopyWith<$Res>(_self.signUpResponse!, (value) {
    return _then(_self.copyWith(signUpResponse: value));
  });
}
}

// dart format on
