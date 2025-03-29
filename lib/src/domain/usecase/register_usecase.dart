import 'package:flutter_base/src/core/common/token_manager/token_manager.dart';
import 'package:flutter_base/src/domain/entity/register_entity.dart';
import 'package:flutter_base/src/domain/entity/user_entity.dart';
import 'package:flutter_base/src/domain/repository/auth_repository.dart';

class RegisterUsecase {
  final AuthRepository _authRepository;
  final TokenManager _tokenManager;
  RegisterUsecase(this._authRepository, this._tokenManager);

  Future<UserEntity?> call(RegisterEntity params) async {
    final auth = await _authRepository.register(params);
    await _tokenManager.saveToken(
        accessToken: auth.accessToken, refreshToken: auth.refreshToken);
    return auth.user;
  }
}
