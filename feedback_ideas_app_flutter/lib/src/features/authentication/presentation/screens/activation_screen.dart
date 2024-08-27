import 'package:feedback_ideas_app_flutter/src/core/utils/route_query_parameters.dart';
import 'package:feedback_ideas_app_flutter/src/features/authentication/presentation/widgets/activation_page_widget.dart';
import 'package:feedback_ideas_app_flutter/src/features/authentication/presentation/widgets/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class ActivationScreen extends StatelessWidget {
  const ActivationScreen({
    super.key,
    this.queryParameters = const <String, dynamic>{},
  });

  static const String route = '/activate_account';
  static const String fullPath = '/activate_account';

  final Map<String, dynamic> queryParameters;

  static String buildFullPath([Map<String, dynamic> queryParameters = const <String, dynamic>{}]) {
    final String queryString = RouteQueryParameters.toQueryString(queryParameters);
    return queryString.isNotEmpty ? '$fullPath?$queryString' : fullPath;
  }

  static void push(
    BuildContext context, {
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    context.push(
      buildFullPath(queryParameters),
      extra: extra,
    );
  }

  static void go(
    BuildContext context, {
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    context.go(
      buildFullPath(queryParameters),
      extra: extra,
    );
  }

  static Widget builder(BuildContext context, GoRouterState state) {
    final queryParameters = Map<String, dynamic>.from(state.uri.queryParameters);
    return ActivationScreen(
      queryParameters: queryParameters,
    );
  }

  @override
  Widget build(BuildContext context) {
    print(queryParameters);
    return Scaffold(
      body: ActivationPageWidget(
        queryParameters: queryParameters,
      ),
    );
  }
}
