import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:just_play_demo/data/models/city.dart';
import 'package:just_play_demo/presentation/pages/auth/auth_page.dart';
import 'package:just_play_demo/presentation/pages/home/home_page.dart';
import 'package:just_play_demo/presentation/pages/location/location_page.dart';
import 'package:just_play_demo/presentation/routes/redirects.dart';
import 'package:just_play_demo/presentation/routes/routes.dart';
import 'package:just_play_demo/presentation/routes/transitions.dart';

abstract class NavigationService {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter? _curRouter;

  static GoRouter get router {
    return _curRouter ??= getRouter();
  }

  /// Declaration of the go router behaviour. Go router is a package supported
  /// by flutter.
  /// https://pub.dev/packages/go_router
  /// There is a builder package that makes it easier to use but I haven't study
  /// it yet
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
          pageBuilder: (context, state) {
            final City city = state.extra as City;
            return FadeTransitionPage(
              key: state.pageKey,
              child: HomePage(
                city: city,
              ),
            );
          },
          redirect: AppRedirects.homeRedirect,
        ),
        GoRoute(
          name: AppRoutes.locationSelection,
          path: AppRoutes.locationSelection,
          parentNavigatorKey: rootNavigatorKey,
          pageBuilder: (context, state) {
            return SlideTransitionPage(
              key: state.pageKey,
              child: const LocationPage(),
            );
          },
        ),
      ],
      redirect: AppRedirects.globalRedirect,
    );
  }
}
