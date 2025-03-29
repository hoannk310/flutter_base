import 'package:dio/dio.dart';
import 'package:flutter_base/src/data/model/remote/request/login_request_dto.dart';
import 'package:flutter_base/src/data/model/remote/request/register_request_dto.dart';
import 'package:flutter_base/src/data/model/remote/response/auth_response_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_service.g.dart';

@RestApi()
abstract class AuthService {
  factory AuthService(Dio dio) = _AuthService;

  @POST('/auth/login')
  Future<AuthResponseDTO> login(@Body() LoginRequestDto request);
  @POST('/auth/register')
  Future<AuthResponseDTO> register(@Body() RegisterRequestDTO request);
  @POST('/auth/logout')
  Future<void> logout();
}
