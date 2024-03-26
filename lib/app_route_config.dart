import 'package:flutter_zoom/screens/sign_in_screen.dart';
import 'package:flutter_zoom/utils/enum/app_route_enum.dart';
import 'package:go_router/go_router.dart';

import 'screens/dashboard_screen.dart';

final class AppRouteConfig {
  AppRouteConfig._();

  static final routeConfig = GoRouter(
    initialLocation: AppRouteEnum.signIn.path,
    routes: <RouteBase>[
      GoRoute(
          name: AppRouteEnum.signIn.name,
          path: AppRouteEnum.signIn.path,
          builder: (context, state) => const SignInScreen(),
          routes: [
            GoRoute(
              name: AppRouteEnum.dashboard.name,
              path: AppRouteEnum.dashboard.path,
              builder: (context, state) => const DashboardScreen(),
            ),
          ]),
    ],
  );
}
