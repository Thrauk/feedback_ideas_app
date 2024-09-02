import 'package:feedback_ideas_app_flutter/src/core/utils/route_query_parameters.dart';
import 'package:feedback_ideas_app_flutter/src/features/ideas/presentation/widgets/all_ideas_page_widget.dart';
import 'package:feedback_ideas_app_flutter/src/features/ideas/presentation/widgets/my_ideas_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AllIdeasScreen extends StatelessWidget {
  const AllIdeasScreen({
    super.key,
    this.queryParameters = const <String, dynamic>{},
  });

  static const String route = '/feed';
  static const String fullPath = '/feed';

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
    return AllIdeasScreen(
      queryParameters: queryParameters,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AllIdeasPageWidget(
        queryParameters: queryParameters,
      ),
    );
  }
}
