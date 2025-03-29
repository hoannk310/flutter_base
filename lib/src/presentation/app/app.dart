import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/res/l10n/app_localizations.dart';
import 'package:flutter_base/src/core/common/app_manager/app_manager.dart';
import 'package:flutter_base/src/presentation/home/home_page.dart';
import 'package:flutter_base/src/presentation/login/login_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLogin = ref.watch(appManagerProvider).isLogin;
    final isLoading = ref.watch(appManagerProvider).isLoading;

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: isLoading
          ? CupertinoActivityIndicator()
          : isLogin
              ? const HomePage()
              : const LoginPage(),
    );
  }
}
