import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:just_play_demo/data/global_blocs/auth_cubit.dart';
import 'package:just_play_demo/injectable.dart';
import 'package:just_play_demo/presentation/routes/routes.dart';

// Redirects are the best way to handle behaviour while navigating
// for example, the most common is that if the user is no authenticathed
// we redirect into the login screen.
abstract class AppRedirects {
  static Future<String?> globalRedirect(
    BuildContext context,
    GoRouterState state,
  ) async {
    final authCubit = getIt<AuthCubit>();
    final bool isUserAuthenticated = authCubit.user != null;
    if (!isUserAuthenticated) {
      return AppRoutes.login;
    }

    return null;
  }

  static Future<String?> homeRedirect(
    BuildContext context,
    GoRouterState state,
  ) async {
    // for ease of use I'll disable this condition
    // if (state.extra == null) {
    //   return AppRoutes.locationSelection;
    // }

    return null;
  }
}
