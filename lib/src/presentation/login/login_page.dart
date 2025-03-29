import 'package:flutter/material.dart';
import 'package:flutter_base/src/domain/entity/register_entity.dart';
import 'package:flutter_base/src/presentation/login/login_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  void _onLoginButtonPressed(BuildContext context, WidgetRef ref) {
    ref
        .read(loginViewModelProvider.notifier)
        .login('hoan4@gmail.com', 'A123456');
  }

  void _onRegisterButtonPressed(BuildContext context, WidgetRef ref) {
    ref.read(loginViewModelProvider.notifier).register(RegisterEntity(
        email: 'hoan4@gmail.com',
        password: 'A123456',
        name: "hoannk",
        age: 20));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Login Page'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _onLoginButtonPressed(context, ref),
              child: const Text('Login'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _onRegisterButtonPressed(context, ref),
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
