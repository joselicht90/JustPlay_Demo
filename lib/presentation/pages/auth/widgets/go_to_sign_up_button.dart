import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_play_demo/extensions/context_extensions.dart';
import 'package:just_play_demo/presentation/pages/auth/cubit/auth_page_cubit.dart';

class GoToSignUpButton extends StatelessWidget {
  const GoToSignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthPageCubit>();
    return Builder(builder: (context) {
      return SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don\'t have an account?',
              style: context.textTheme.bodyMedium!.copyWith(
                color: context.theme.colorScheme.onBackground,
              ),
            ),
            TextButton(
              onPressed: () {
                authCubit.setScreen(isSigningUp: true);
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      );
    });
  }
}
