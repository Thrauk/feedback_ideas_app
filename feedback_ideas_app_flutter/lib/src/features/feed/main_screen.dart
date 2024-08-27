import 'package:feedback_ideas_app_flutter/src/features/feed/main_page_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  static const String route = '/feed';
  static const String fullPath = '/feed';

  static String buildFullPath() {
    return fullPath;
  }

  static void push(
    BuildContext context, {
    Object? extra,
  }) {
    context.push(buildFullPath(), extra: extra);
  }

  static void go(
    BuildContext context, {
    Object? extra,
  }) {
    context.go(buildFullPath(), extra: extra);
  }

  static Widget builder(BuildContext context, GoRouterState state) {
    return const MainScreen();
  }

  @override
  Widget build(BuildContext context) {
    return const MainPageWidget();
  }
}
