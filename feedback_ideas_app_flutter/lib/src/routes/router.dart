import 'package:feedback_ideas_app_flutter/main.dart';
import 'package:feedback_ideas_app_flutter/src/core/widgets/navbar/desktop_navbar.dart';
import 'package:feedback_ideas_app_flutter/src/core/widgets/navbar/desktop_navbar_old.dart';
import 'package:feedback_ideas_app_flutter/src/features/authentication/presentation/screens/activation_screen.dart';
import 'package:feedback_ideas_app_flutter/src/features/authentication/presentation/screens/login_screen.dart';
import 'package:feedback_ideas_app_flutter/src/features/feed/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/authentication/presentation/screens/register_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final GlobalKey<NavigatorState> _shellNavbarKey = GlobalKey<NavigatorState>(debugLabel: 'navbarShell');

final GoRouter mainRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      redirect: (context, state) => LoginScreen.route,
    ),
    GoRoute(
      path: LoginScreen.route,
      name: 'Login',
      pageBuilder: (context, state) => NoTransitionPage(child: LoginScreen.builder(context, state)),
    ),
    GoRoute(
      path: RegisterScreen.route,
      pageBuilder: (context, state) => NoTransitionPage(child: RegisterScreen.builder(context, state)),
    ),
    GoRoute(
      path: ActivationScreen.route,
      pageBuilder: (context, state) => NoTransitionPage(child: ActivationScreen.builder(context, state)),
    ),
    ShellRoute(
      navigatorKey: _shellNavbarKey,
      builder: (context, state, child) {
        return DesktopNavbar(state: state, child: child);
      },
      routes: [
        GoRoute(
          path: MainScreen.route,
          pageBuilder: (context, state) => NoTransitionPage(
            child: MainScreen.builder(context, state),
          ),
        ),
      ],
    ),
  ],
  redirect: (context, state) async {
    final bool loggedIn = (await authManager.get()) != null;
    final bool onAuthPage = state.matchedLocation == LoginScreen.route ||
        state.matchedLocation == RegisterScreen.route ||
        state.matchedLocation == ActivationScreen.route;
    if (!loggedIn) {
      if (onAuthPage) {
        return null;
      }
      return RegisterScreen.route;
    }
    if (loggedIn && onAuthPage) {
      return MainScreen.route;
    }
    return null;
  },
);
