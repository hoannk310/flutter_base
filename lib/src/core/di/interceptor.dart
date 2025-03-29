import 'package:flutter_base/src/core/network/auth_interceptor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'interceptor.g.dart';

@riverpod
AuthInterceptor authInterceptor(Ref ref) => AuthInterceptor(ref);
