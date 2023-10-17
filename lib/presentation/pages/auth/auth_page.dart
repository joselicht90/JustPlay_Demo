import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:just_play_demo/extensions/context_extensions.dart';
import 'package:just_play_demo/injectable.dart';
import 'package:just_play_demo/presentation/pages/auth/cubit/auth_page_cubit.dart';
import 'package:just_play_demo/presentation/pages/auth/login_screen.dart';
import 'package:just_play_demo/presentation/pages/auth/sign_up_screen.dart';
import 'package:just_play_demo/presentation/routes/routes.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<AuthPageCubit>(),
      child: const AuthPageConsumer(),
    );
  }
}

class AuthPageConsumer extends StatelessWidget {
  const AuthPageConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthPageCubit, AuthPageState>(
        listener: (context, state) {
          if (state is SignInError) {
            context.showError(error: state.error);
          }

          if (state is SignUpSuccess || state is SignInSuccess) {
            context.go(AppRoutes.home);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 30.h,
                  child: Image.asset(
                    'assets/images/just_play_dark.png',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: state is SigninIn
                        ? const LoginScreen()
                        : const SignUpScreen(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
