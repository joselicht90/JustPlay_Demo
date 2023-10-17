import 'package:flutter/material.dart';
import 'package:just_play_demo/presentation/pages/auth/widgets/go_to_sign_in_button.dart';
import 'package:just_play_demo/presentation/pages/auth/widgets/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        SignUpForm(),
        SizedBox(height: 20),
        GoToSignInButton(),
      ],
    );
  }
}
