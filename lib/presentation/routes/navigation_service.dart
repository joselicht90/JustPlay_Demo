import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:just_play_demo/presentation/pages/auth/auth_page.dart';
import 'package:just_play_demo/presentation/pages/home/home_page.dart';
import 'package:just_play_demo/presentation/routes/redirects.dart';
import 'package:just_play_demo/presentation/routes/routes.dart';

abstract class NavigationService {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter? _curRouter;

  static GoRouter get router {
    return _curRouter ??= getRouter();
  }

  /// Navigates to a desired widget
  static GoRouter getRouter() {
    return GoRouter(
      errorBuilder: (context, state) {
        return const Scaffold(
          body: Center(
            child: Text('Page not found'),
          ),
        );
      },
      navigatorKey: rootNavigatorKey,
      initialLocation: AppRoutes.home,
      routes: [
        GoRoute(
          path: AppRoutes.login,
          name: AppRoutes.login,
          parentNavigatorKey: rootNavigatorKey,
          builder: (BuildContext context, GoRouterState state) {
            return const AuthPage();
          },
        ),
        GoRoute(
          name: AppRoutes.home,
          path: AppRoutes.home,
          parentNavigatorKey: rootNavigatorKey,
          builder: (BuildContext context, GoRouterState state) {
            return const HomePage();
          },
        ),
      ],
      redirect: AppRedirects.globalRedirect,
    );
  }
}
