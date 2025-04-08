import 'package:clean_arc_riverpod/core/data/remote/network_service.dart';
import 'package:clean_arc_riverpod/features/signup/data/dto/signup_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

part 'signup_api.g.dart';

final signUpApiProvider = Provider<SignUpApi>((ref) {
  final dio = ref.watch(networkServiceProvider);
  return SignUpApi(dio);
});

@RestApi()
abstract class SignUpApi {
  factory SignUpApi(Dio dio) => _SignUpApi(dio);

  @POST('/signup')
  Future<SignUpResponse> signup(@Body() Map<String, dynamic> body);
}
