import 'package:feedback_ideas_app_client/feedback_ideas_app_client.dart';
import 'package:feedback_ideas_app_flutter/src/core/serverpod/custom_auth_key_manager.dart';
import 'package:feedback_ideas_app_flutter/src/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:url_strategy/url_strategy.dart';

var authManager = CustomAuthKeyManager();

var serverpodClient = Client(
  'http://$localhost:8080/',
  authenticationKeyManager: authManager,
)..connectivityMonitor = FlutterConnectivityMonitor();

void main() {
  setPathUrlStrategy();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  authManager.addListener(
    () {
      print('Something happened!');
      mainRouter.refresh();
    },
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ShadApp.materialRouter(
      title: 'Feedback App',
      darkTheme: ShadThemeData(
        brightness: Brightness.dark,
        colorScheme: ShadColorScheme.fromName('orange'),
      ),
      routerConfig: mainRouter,
    );
  }
}
