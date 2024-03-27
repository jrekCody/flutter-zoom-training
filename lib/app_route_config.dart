import 'package:flutter/material.dart';
import 'package:flutter_zoom/feature/auth/sign_in/sign_in_screen.dart';
import 'package:flutter_zoom/feature/splash_screen.dart';
import 'package:flutter_zoom/utils/enum/app_route_enum.dart';
import 'package:go_router/go_router.dart';

import 'feature/dashboard_screen.dart';

final class AppRouteConfig {
  AppRouteConfig._();

  static final _rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');

  static final routeConfig = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRouteEnum.splash.path,
    routes: <RouteBase>[
      GoRoute(
        name: AppRouteEnum.splash.name,
        path: AppRouteEnum.splash.path,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        name: AppRouteEnum.signIn.name,
        path: AppRouteEnum.signIn.path,
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        name: AppRouteEnum.dashboard.name,
        path: AppRouteEnum.dashboard.path,
        builder: (context, state) => const DashboardScreen(),
      ),
    ],
  );
}
