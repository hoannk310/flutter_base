import 'package:flutter_base/src/core/common/app_manager/app_manager.dart';
import 'package:flutter_base/src/domain/di/usecases.dart';
import 'package:flutter_base/src/domain/entity/login_entity.dart';
import 'package:flutter_base/src/domain/entity/register_entity.dart';
import 'package:flutter_base/src/presentation/login/login_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_view_model.g.dart';

@riverpod
class LoginViewModel extends _$LoginViewModel {
  @override
  LoginState build() {
    final initState =
        LoginState(isLoading: false, isError: false, errorMessage: "");
    return initState;
  }

  Future<void> login(String email, String password) async {
    try {
      state = state.copyWith(isLoading: true, isError: false);
      await ref
          .read(loginUsecaseProvider)
          .call(LoginEntity(email: email, password: password));
      state = state.copyWith(isLoading: false, isError: false);
      await ref.read(appManagerProvider.notifier).checkLoginStatus();
    } catch (e) {
      state = state.copyWith(
          isLoading: false, isError: true, errorMessage: e.toString());
    }
  }

  Future<void> register(RegisterEntity register) async {
    try {
      state = state.copyWith(isLoading: true, isError: false);
      await ref.read(registerUsecaseProvider).call(RegisterEntity(
          email: register.email,
          password: register.password,
          name: register.name,
          age: register.age));
      state = state.copyWith(isLoading: false, isError: false);
      await ref.read(appManagerProvider.notifier).checkLoginStatus();
    } catch (e) {
      state = state.copyWith(
          isLoading: false, isError: true, errorMessage: e.toString());
    }
  }
}
