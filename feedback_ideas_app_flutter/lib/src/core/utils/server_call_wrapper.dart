import 'package:feedback_ideas_app_client/feedback_ideas_app_client.dart';
import 'package:feedback_ideas_app_flutter/main.dart';

Future<T> serverCallWrapper<T>(Future<T> Function() serverCall) async {
  try {
    return await serverCall();
  } catch (e) {
    if (e is ServerpodClientException) {
      if (e.statusCode == 401) {
        await serverpodClient.authenticationKeyManager?.remove();
      }
    }
    rethrow;
  }
}
