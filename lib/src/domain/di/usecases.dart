import 'package:flutter_base/src/core/common/token_manager/token_manager.dart';
import 'package:flutter_base/src/domain/di/repositories.dart';
import 'package:flutter_base/src/domain/usecase/login_usecase.dart';
import 'package:flutter_base/src/domain/usecase/logout_usecase.dart';
import 'package:flutter_base/src/domain/usecase/register_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'usecases.g.dart';

@riverpod
LoginUsecase loginUsecase(Ref ref) => LoginUsecase(
      ref.read(authRepositoryProvider),
      ref.read(tokenManagerProvider),
    );

@riverpod
RegisterUsecase registerUsecase(Ref ref) => RegisterUsecase(
      ref.read(authRepositoryProvider),
      ref.read(tokenManagerProvider),
    );

@riverpod
LogoutUsecase logoutUsecase(Ref ref) => LogoutUsecase(
      ref.read(authRepositoryProvider),
      ref.read(tokenManagerProvider),
    );
