import 'package:flutter_base/src/data/model/remote/request/login_request_dto.dart';
import 'package:flutter_base/src/data/model/remote/request/register_request_dto.dart';
import 'package:flutter_base/src/data/model/remote/response/auth_response_dto.dart';
import 'package:flutter_base/src/data/data_source/remote/services/auth_service.dart';
import 'package:flutter_base/src/domain/entity/auth_entity.dart';
import 'package:flutter_base/src/domain/entity/login_entity.dart';
import 'package:flutter_base/src/domain/entity/register_entity.dart';
import 'package:flutter_base/src/domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthService _authService;
  AuthRepositoryImpl(this._authService);

  @override
  Future<AuthEntity> login(LoginEntity loginEntity) async {
    final response = await _authService.login(
      LoginRequestDto.fromEntity(loginEntity),
    );
    return response.toEntity();
  }

  @override
  Future<void> logout() => _authService.logout();

  @override
  Future<AuthEntity> register(RegisterEntity registerEntity) async {
    final response = await _authService
        .register(RegisterRequestDTO.fromEntity(registerEntity));
    return response.toEntity();
  }
}
