import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travisgen_client/presentation/profile/view/profile_page.dart';
import 'package:travisgen_client/presentation/splash/view/splash_page.dart';

class GoRouterObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}

class AppRouter {
  static const splash = '/';
  static const authorize = '/authorize';
  static const login = '/login';
  static const register = '/register';

  static const profilePage = '/profile';

  // Root
  static const String root = '/root';

  factory AppRouter() {
    return _instance;
  }

  AppRouter._() {
    _router = _createRouter();
  }

  static final AppRouter _instance = AppRouter._();

  late final GoRouter _router;

  GoRouter get router => _router;

  GoRouter _createRouter() {
    return GoRouter(
      initialLocation: splash,
      debugLogDiagnostics: true,
      observers: [GoRouterObserver()],
      routes: [
        GoRoute(
          path: splash,
          name: splash,
          pageBuilder: (context, state) {
            return MaterialPage(key: state.pageKey, child: const SplashPage());
          },
        ),
        // GoRoute(
        //   path: authorize,
        //   name: authorize,
        //   pageBuilder: (context, state) {
        //     SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
        //     final args = state.extra as Map<String, dynamic>?;

        //     return MaterialPage(
        //       key: state.pageKey,
        //       child: AuthorizePage(
        //         form: args?['form'] != null ? AuthForm.values.byName(args!['form'] as String) : null,
        //         resetPasswordPayload: args?['code'] != null && args?['email'] != null
        //             ? ResetPasswordPayload(code: args!['code'] as String, email: args['email'] as String)
        //             : null,
        //         verifyTokenArguments: args?['tokenArguments'] != null
        //             ? args!['tokenArguments'] as VerifyTokenArguments
        //             : null,
        //       ),
        //     );
        //   },
        // ),
        GoRoute(
          path: profilePage,
          name: profilePage,
          pageBuilder: (context, state) {
            return MaterialPage(key: state.pageKey, child: ProfilePage());
          },
        ),
      ],
    );
  }
}
