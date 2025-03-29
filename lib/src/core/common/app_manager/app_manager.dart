import 'package:flutter_base/src/core/common/app_manager/app_state.dart';
import 'package:flutter_base/src/core/common/token_manager/token_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_manager.g.dart';

@Riverpod(keepAlive: true)
class AppManager extends _$AppManager {
  @override
  AppState build() {
    Future.microtask(() => checkLoginStatus());
    return AppState(isLogin: false, isLoading: false);
  }

  Future<void> checkLoginStatus() async {
    state = state.copyWith(isLoading: true);
    final accessToken = await ref.read(tokenManagerProvider).getAccessToken();
    state = state.copyWith(isLogin: accessToken != null, isLoading: false);
  }
}
