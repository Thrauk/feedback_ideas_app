import 'package:feedback_ideas_app_flutter/src/features/authentication/presentation/widgets/register_form.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  static const String route = '/register';
  static const String fullPath = '/register';

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
    return const RegisterScreen();
  }

  @override
  Widget build(BuildContext context) {
    return const RegisterForm();
  }
}
