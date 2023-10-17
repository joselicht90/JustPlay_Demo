import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_play_demo/extensions/context_extensions.dart';
import 'package:just_play_demo/presentation/pages/auth/cubit/auth_page_cubit.dart';

class GoToSignInButton extends StatelessWidget {
  const GoToSignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthPageCubit>();
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Do you already have an account?',
            style: context.textTheme.bodyMedium!.copyWith(
              color: context.theme.colorScheme.onBackground,
            ),
          ),
          TextButton(
            onPressed: () {
              authCubit.setScreen(isSigningUp: false);
            },
            child: const Text('Sign In'),
          ),
        ],
      ),
    );
  }
}
