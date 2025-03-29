import 'package:flutter_base/src/core/common/token_manager/token_manager.dart';
import 'package:flutter_base/src/domain/repository/auth_repository.dart';

class LogoutUsecase {
  final AuthRepository _authRepository;
  final TokenManager _tokenManager;

  LogoutUsecase(this._authRepository, this._tokenManager);

  Future<void> call() async {
    await _authRepository.logout();
    await _tokenManager.clearTokens();
  }
}
