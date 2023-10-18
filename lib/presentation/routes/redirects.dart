import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:just_play_demo/data/global_blocs/auth_cubit.dart';
import 'package:just_play_demo/injectable.dart';
import 'package:just_play_demo/presentation/routes/routes.dart';

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
    if (state.extra == null) {
      return AppRoutes.locationSelection;
    }

    return null;
  }
}
