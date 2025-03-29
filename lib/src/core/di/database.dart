import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../database/db_manager.dart';

part 'database.g.dart';

@riverpod
DbManager dbManager(Ref ref) => DbManager();
