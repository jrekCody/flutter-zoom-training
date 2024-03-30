import 'package:flutter/material.dart';
import 'package:flutter_zoom/feature/auth/sign_in/sign_in_screen.dart';
import 'package:flutter_zoom/feature/contacts/contacts_screen.dart';
import 'package:flutter_zoom/feature/meet_chat/new_meeting/new_meeting_screen.dart';
import 'package:flutter_zoom/feature/meeting/meeting_screen.dart';
import 'package:flutter_zoom/feature/settings/settings_screen.dart';
import 'package:flutter_zoom/feature/splash_screen.dart';
import 'package:flutter_zoom/utils/enum/app_route_enum.dart';
import 'package:go_router/go_router.dart';

import 'feature/dashboard_screen.dart';

final class AppRouteConfig {
  AppRouteConfig._();

  static final _rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');

  static final _shellNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'shell');

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

      StatefulShellRoute.indexedStack(
        builder: (
          context,
          state,
          navigationShell,
        ) =>
            DashboardScreen(
          navigationShell: navigationShell,
        ),
        branches: [
          _meetChat,
          _meetings,
          _contacts,
          _settings,
        ],
      )
    ],
  );

  static final _meetChat = StatefulShellBranch(
    navigatorKey: _shellNavigatorKey,
    routes: [
      GoRoute(
        name: AppRouteEnum.newMeet.name,
        path: AppRouteEnum.newMeet.path,
        builder: (_, __) => const NewMeetingScreen(),
      ),
    ],
  );

  static final _meetings = StatefulShellBranch(
    routes: [
      GoRoute(
        name: AppRouteEnum.meetings.name,
        path: AppRouteEnum.meetings.path,
        builder: (_, __) => const MeetingScreen(),
      ),
    ],
  );

  static final _contacts = StatefulShellBranch(
    routes: [
      GoRoute(
        name: AppRouteEnum.contacts.name,
        path: AppRouteEnum.contacts.path,
        builder: (_, __) => const ContactsScreen(),
      ),
    ],
  );

  static final _settings = StatefulShellBranch(
    routes: [
      GoRoute(
        name: AppRouteEnum.settings.name,
        path: AppRouteEnum.settings.path,
        builder: (_, __) => const SettingsScreen(),
      ),
    ],
  );
}
