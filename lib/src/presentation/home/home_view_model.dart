import 'package:flutter_base/src/core/common/app_manager/app_manager.dart';
import 'package:flutter_base/src/domain/di/usecases.dart';
import 'package:flutter_base/src/presentation/home/home_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_view_model.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  @override
  HomeState build() {
    final initState = HomeState(isLoading: false, isError: false);
    return initState;
  }

  Future<void> logout() async {
    state = state.copyWith(isLoading: true, isError: false);
    await ref.read(logoutUsecaseProvider).call();
    state = state.copyWith(isLoading: false, isError: false);
    await ref.read(appManagerProvider.notifier).checkLoginStatus();
  }
}
