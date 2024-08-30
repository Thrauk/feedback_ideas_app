import 'package:serverpod/serverpod.dart';

class AuthenticationInfoExteded extends AuthenticationInfo {
  AuthenticationInfoExteded(super.userId, super.scopes, this.userUuid);

  final String userUuid;
}
