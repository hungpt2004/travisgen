import 'package:flutter/material.dart';

class AppPageTransitions {
  AppPageTransitions._();

  static const PageTransitionsBuilder slideTransition = CupertinoPageTransitionsBuilder();

  static const PageTransitionsBuilder fadeTransition = FadeUpwardsPageTransitionsBuilder();

  static Widget slideFromBottomTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return SlideTransition(
      position: animation.drive(
        Tween(begin: const Offset(0, 1), end: Offset.zero).chain(
          CurveTween(curve: Curves.easeInOut),
        ),
      ),
      child: child,
    );
  }

  static Widget slideFromRightTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return SlideTransition(
      position: animation.drive(
        Tween(begin: const Offset(1, 0), end: Offset.zero).chain(
          CurveTween(curve: Curves.easeInOut),
        ),
      ),
      child: child,
    );
  }

  static Widget fadeScaleTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: Tween<double>(
          begin: 0.8,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          ),
        ),
        child: child,
      ),
    );
  }

  static Widget noTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }

  static PageTransitionsTheme get theme => const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
        },
      );
}

enum PageTransitionType {
  slide,
  fade,
  slideFromBottom,
  slideFromRight,
  fadeScale,
  none,
}

extension PageTransitionTypeExtension on PageTransitionType {
  Widget Function(
    BuildContext,
    Animation<double>,
    Animation<double>,
    Widget,
  ) get builder {
    switch (this) {
      case PageTransitionType.slide:
        return (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: animation.drive(
              Tween(begin: const Offset(1, 0), end: Offset.zero).chain(
                CurveTween(curve: Curves.easeInOut),
              ),
            ),
            child: child,
          );
        };
      case PageTransitionType.fade:
        return (context, animation, secondaryAnimation, child) => FadeTransition(
              opacity: animation,
              child: child,
            );
      case PageTransitionType.slideFromBottom:
        return AppPageTransitions.slideFromBottomTransition;
      case PageTransitionType.slideFromRight:
        return AppPageTransitions.slideFromRightTransition;
      case PageTransitionType.fadeScale:
        return AppPageTransitions.fadeScaleTransition;
      case PageTransitionType.none:
        return AppPageTransitions.noTransition;
    }
  }
}
