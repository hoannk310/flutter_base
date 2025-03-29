import 'package:flutter_base/src/data/di/services.dart';
import 'package:flutter_base/src/data/repository_impl/auth_repository_impl.dart';
import 'package:flutter_base/src/domain/repository/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repositories.g.dart';

@riverpod
AuthRepository authRepository(Ref ref) =>
    AuthRepositoryImpl(ref.read(authServiceProvider));
