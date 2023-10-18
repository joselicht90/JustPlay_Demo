import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:just_play_demo/data/global_blocs/auth_cubit.dart';
import 'package:just_play_demo/presentation/routes/routes.dart';

class JPLogoutButton extends StatelessWidget {
  const JPLogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<AuthCubit>().logOut();
        context.go(AppRoutes.login);
      },
      icon: const Icon(
        Icons.logout,
      ),
    );
  }
}
