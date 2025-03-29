import 'package:flutter_base/src/data/data_source/remote/services/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/di/network.dart';

part 'services.g.dart';

@riverpod
AuthService authService(Ref ref) => AuthService(ref.read(dioProvider));
