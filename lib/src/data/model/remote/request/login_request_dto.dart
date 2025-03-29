import 'package:flutter_base/src/domain/entity/login_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_request_dto.freezed.dart';
part 'login_request_dto.g.dart';

@freezed
class LoginRequestDto with _$LoginRequestDto {
  const factory LoginRequestDto({
    required String email,
    required String password,
  }) = _LoginRequestDto;

  factory LoginRequestDto.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestDtoFromJson(json);

  factory LoginRequestDto.fromEntity(LoginEntity entity) => LoginRequestDto(
        email: entity.email,
        password: entity.password,
      );
}
