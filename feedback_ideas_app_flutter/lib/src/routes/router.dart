import 'package:feedback_ideas_app_flutter/src/features/authentication/presentation/screens/activation_screen.dart';
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
      redirect: (context, state) => RegisterScreen.route,
    ),
    // GoRoute(
    //   path: LoginScreen.route,
    //   name: 'Login',
    //   builder: (context, state) => const LoginScreen(),
    // ),
    GoRoute(
      path: RegisterScreen.route,
      builder: (context, state) => RegisterScreen.builder(context, state),
    ),
    GoRoute(
      path: ActivationScreen.route,
      builder: (context, state) => ActivationScreen.builder(context, state),
    ),
  ],
  redirect: (context, state) async {
    // final bool loggedIn = (await serverpodClient.authenticationKeyManager?.get()) != null;
    // final bool onAuthPage = state.matchedLocation == LoginScreen.route || state.matchedLocation == RegisterScreen.route;
    // if (!loggedIn) {
    //   if (onAuthPage) {
    //     return null;
    //   }
    //   return LoginScreen.route;
    // }
    // if (loggedIn && onAuthPage) {
    //   return MainScreen.route;
    // }
    // return null;
  },
);
