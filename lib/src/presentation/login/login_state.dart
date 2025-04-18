import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  factory LoginState({
    required bool isLoading,
    required bool isError,
    required String errorMessage,
  }) = _LoginState;
}
