import 'package:flutter_base/src/core/common/token_manager/token_manager.dart';
import 'package:flutter_base/src/domain/entity/login_entity.dart';
import 'package:flutter_base/src/domain/entity/user_entity.dart';
import 'package:flutter_base/src/domain/repository/auth_repository.dart';

class LoginUsecase {
  final AuthRepository _authRepository;
  final TokenManager _tokenManager;
  LoginUsecase(this._authRepository, this._tokenManager);

  Future<UserEntity?> call(LoginEntity params) async {
    final auth = await _authRepository.login(params);
    await _tokenManager.saveToken(
        accessToken: auth.accessToken, refreshToken: auth.refreshToken);
    return auth.user;
  }
}
