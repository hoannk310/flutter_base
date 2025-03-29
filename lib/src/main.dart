import 'package:flutter/material.dart';
import 'package:flutter_base/src/presentation/app/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  runApp(const ProviderScope(
    child: App(),
  ));
}
