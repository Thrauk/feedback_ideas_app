/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod_serialization/serverpod_serialization.dart';

abstract class JwtPayload
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  JwtPayload._({
    required this.scopes,
    required this.userEmail,
    required this.expirationTimestamp,
    required this.userUuid,
    required this.userId,
  });

  factory JwtPayload({
    required List<String> scopes,
    required String userEmail,
    required int expirationTimestamp,
    required String userUuid,
    required int userId,
  }) = _JwtPayloadImpl;

  factory JwtPayload.fromJson(Map<String, dynamic> jsonSerialization) {
    return JwtPayload(
      scopes: (jsonSerialization['scopes'] as List)
          .map((e) => e as String)
          .toList(),
      userEmail: jsonSerialization['userEmail'] as String,
      expirationTimestamp: jsonSerialization['expirationTimestamp'] as int,
      userUuid: jsonSerialization['userUuid'] as String,
      userId: jsonSerialization['userId'] as int,
    );
  }

  List<String> scopes;

  String userEmail;

  int expirationTimestamp;

  String userUuid;

  int userId;

  JwtPayload copyWith({
    List<String>? scopes,
    String? userEmail,
    int? expirationTimestamp,
    String? userUuid,
    int? userId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'scopes': scopes.toJson(),
      'userEmail': userEmail,
      'expirationTimestamp': expirationTimestamp,
      'userUuid': userUuid,
      'userId': userId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'scopes': scopes.toJson(),
      'userEmail': userEmail,
      'expirationTimestamp': expirationTimestamp,
      'userUuid': userUuid,
      'userId': userId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _JwtPayloadImpl extends JwtPayload {
  _JwtPayloadImpl({
    required List<String> scopes,
    required String userEmail,
    required int expirationTimestamp,
    required String userUuid,
    required int userId,
  }) : super._(
          scopes: scopes,
          userEmail: userEmail,
          expirationTimestamp: expirationTimestamp,
          userUuid: userUuid,
          userId: userId,
        );

  @override
  JwtPayload copyWith({
    List<String>? scopes,
    String? userEmail,
    int? expirationTimestamp,
    String? userUuid,
    int? userId,
  }) {
    return JwtPayload(
      scopes: scopes ?? this.scopes.clone(),
      userEmail: userEmail ?? this.userEmail,
      expirationTimestamp: expirationTimestamp ?? this.expirationTimestamp,
      userUuid: userUuid ?? this.userUuid,
      userId: userId ?? this.userId,
    );
  }
}
