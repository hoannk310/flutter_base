import 'package:flutter_base/src/data/model/remote/response/user_response_dto.dart';
import 'package:flutter_base/src/domain/entity/auth_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_response_dto.freezed.dart';
part 'auth_response_dto.g.dart';

@freezed
class AuthResponseDTO with _$AuthResponseDTO {
  const factory AuthResponseDTO({
    required String accessToken,
    required String refreshToken,
    required UserResponseDto? user,
  }) = _AuthResponseDTO;

  factory AuthResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseDTOFromJson(json);
}

extension AuthResponseDTOExt on AuthResponseDTO {
  AuthEntity toEntity() => AuthEntity(
        accessToken: accessToken,
        refreshToken: refreshToken,
        user: user?.toEntity(),
      );
}
