import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:feedback_ideas_app_server/src/repository/auth/jwt_repository.dart';
import 'package:feedback_ideas_app_server/src/services/sqlite_service.dart';
import 'package:serverpod/serverpod.dart';

import 'src/generated/protocol.dart';
import 'src/generated/endpoints.dart';

// This is the starting point of your Serverpod server.
void run(List<String> args) async {
  // Initialize Serverpod and connect it with your generated code.
  SqliteService.initialize(databasePath: 'database.db');
  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
    authenticationHandler: (Session session, String token) async {
      final JWT? jwt = JwtRepository().checkToken(token);
      if (jwt == null) {
        return null;
      }
      final JwtPayload payload = JwtPayload.fromJson(jwt.payload);
      Set<Scope> userScopes = payload.scopes.map((scope) => Scope(scope)).toSet();

      return AuthenticationInfo(payload.userId, userScopes);
    },
  );

  // Start the server.
  await pod.start();
}
