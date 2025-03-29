import 'package:flutter_base/src/domain/entity/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_response_dto.freezed.dart';
part 'user_response_dto.g.dart';

@freezed
class UserResponseDto with _$UserResponseDto {
  const factory UserResponseDto({
    required int id,
    required String email,
    required String name,
    required int age,
  }) = _UserResponseDto;

  factory UserResponseDto.fromJson(Map<String, dynamic> json) =>
      _$UserResponseDtoFromJson(json);
}

extension UserResponseDtoExt on UserResponseDto {
  UserEntity toEntity() => UserEntity(
        id: id,
        email: email,
        name: name,
        age: age,
      );
}
