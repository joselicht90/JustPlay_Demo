import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FadeTransitionPage extends CustomTransitionPage<void> {
  FadeTransitionPage({
    required LocalKey key,
    required Widget child,
  }) : super(
          key: key,
          transitionsBuilder: (c, animation, a2, child) => FadeTransition(
            opacity: animation.drive(_curveTween),
            child: child,
          ),
          child: child,
          transitionDuration: const Duration(milliseconds: 400),
        );

  static final _curveTween = CurveTween(curve: Curves.easeIn);
}

class SlideTransitionPage extends CustomTransitionPage<void> {
  SlideTransitionPage({
    required LocalKey key,
    required Widget child,
  }) : super(
          key: key,
          transitionsBuilder: (c, animation, a2, child) {
            return SlideTransition(
              position: animation.drive(_tween),
              child: child,
            );
          },
          child: child,
          transitionDuration: const Duration(milliseconds: 400),
        );

  static const _begin = Offset(0.0, 1.0);
  static const _end = Offset.zero;
  static final _tween =
      Tween(begin: _begin, end: _end).chain(CurveTween(curve: Curves.ease));
}

class HorizontalSlideTransitionPage extends CustomTransitionPage<void> {
  HorizontalSlideTransitionPage({
    required LocalKey key,
    required Widget child,
  }) : super(
          key: key,
          transitionsBuilder: (c, animation, a2, child) {
            return SlideTransition(
              position: animation.drive(_tween),
              child: child,
            );
          },
          child: child,
          transitionDuration: const Duration(milliseconds: 400),
        );

  static const _begin = Offset(1.0, 0.0);
  static const _end = Offset.zero;
  static final _tween =
      Tween(begin: _begin, end: _end).chain(CurveTween(curve: Curves.ease));
}
