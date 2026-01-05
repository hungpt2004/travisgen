import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travisgen_client/app/authentication_status.dart';
import 'package:travisgen_client/app/cubit/app_cubit.dart';
import 'package:travisgen_client/common/theme/app_size.dart';
import 'package:travisgen_client/common/theme/app_theme.dart';
import 'package:travisgen_client/common/utils/location.dart';
import 'package:travisgen_client/di/di.dart';
import 'package:travisgen_client/di/modules/local_module.dart';
import 'package:travisgen_client/router.dart';
import 'package:travisgen_client/widgets/unfocus_wrapper.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  StreamSubscription<AuthState>? _authStreamSubscription;
  AppLifecycleListener? _lifecycleListener;

  @override
  void initState() {
    super.initState();

    _authStreamSubscription = getIt.get<AuthStatusStream>().listen((value) => value.dispatch());

    _lifecycleListener = AppLifecycleListener(onResume: _handleAppResume);
  }

  @override
  void dispose() {
    _authStreamSubscription?.cancel();
    _lifecycleListener?.dispose();
    super.dispose();
  }

  /// Handles app resume event to reload location permissions
  void _handleAppResume() {
    _reloadLocationPermission();
  }

  /// Reloads location permission status
  Future<void> _reloadLocationPermission() async {
    try {
      await LocationService().checkPermission();
    } catch (error) {
      debugPrint('Error checking location permission on resume: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return UnfocusWrapper(
      child: ScreenUtilInit(
        designSize: AppSize.designSize,
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (context, child) {
          return BlocProvider(
            create: (context) => AppCubit(),
            child: MaterialApp.router(
              routerConfig: AppRouter().router,
              theme: themes[ThemeMode.light]!.themeData,
              darkTheme: themes[ThemeMode.dark]!.themeData,
              themeMode: ThemeMode.light,
              debugShowCheckedModeBanner: false,
              builder: (_, child) {
                return Builder(
                  builder: (context) {
                    return child!;
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
