import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_entity.freezed.dart';

@freezed
class RegisterEntity with _$RegisterEntity {
  const factory RegisterEntity({
    required String email,
    required String password,
    required String name,
    required int age,
  }) = _RegisterEntity;
}
