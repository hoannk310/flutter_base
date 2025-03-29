import 'package:flutter_base/src/domain/entity/register_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_request_dto.freezed.dart';
part 'register_request_dto.g.dart';

@freezed
class RegisterRequestDTO with _$RegisterRequestDTO {
  const factory RegisterRequestDTO({
    required String email,
    required String password,
    required String name,
    required int age,
  }) = _RegisterRequestDTO;

  factory RegisterRequestDTO.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestDTOFromJson(json);

  factory RegisterRequestDTO.fromEntity(RegisterEntity entity) =>
      RegisterRequestDTO(
        email: entity.email,
        password: entity.password,
        name: entity.name,
        age: entity.age,
      );
}
