import 'package:flutter_base/src/domain/entity/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_entity.freezed.dart';

@freezed
class AuthEntity with _$AuthEntity {
  const factory AuthEntity({
    required String accessToken,
    required String refreshToken,
    required UserEntity? user,
  }) = _AuthEntity;
}
