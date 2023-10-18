import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:just_play_demo/data/models/city.dart';
import 'package:just_play_demo/data/models/game.dart';
import 'package:just_play_demo/presentation/pages/auth/auth_page.dart';
import 'package:just_play_demo/presentation/pages/game_detail/game_detail_page.dart';
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
          builder: (BuildContext context, GoRouterState state) {
            final City? city = state.extra as City?;
            return HomePage(
              city: city,
            );
          },
          redirect: AppRedirects.homeRedirect,
        ),
        GoRoute(
          path: AppRoutes.gameDetail,
          name: AppRoutes.gameDetail,
          parentNavigatorKey: rootNavigatorKey,
          builder: (BuildContext context, GoRouterState state) {
            //Ideally we receive the game ID as url param and fetch the game on entering the detail
            //page. For simplicity I'm passing the game object as extra
            final Game game = state.extra as Game;
            return GameDetailPage(
              game: game,
            );
          },
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
