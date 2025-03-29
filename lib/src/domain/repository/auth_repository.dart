import 'package:flutter_base/src/domain/entity/auth_entity.dart';
import 'package:flutter_base/src/domain/entity/login_entity.dart';
import 'package:flutter_base/src/domain/entity/register_entity.dart';

abstract class AuthRepository {
  Future<AuthEntity> login(LoginEntity loginEntity);
  Future<AuthEntity> register(RegisterEntity registerEntity);
  Future<void> logout();
}
