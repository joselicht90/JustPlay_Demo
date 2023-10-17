import 'package:flutter/material.dart';
import 'package:just_play_demo/presentation/pages/auth/widgets/go_to_sign_up_button.dart';
import 'package:just_play_demo/presentation/pages/auth/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LoginForm(),
        SizedBox(height: 20),
        GoToSignUpButton(),
      ],
    );
  }
}
