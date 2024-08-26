/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class LoginResponse implements _i1.SerializableModel {
  LoginResponse._({required this.token});

  factory LoginResponse({required String token}) = _LoginResponseImpl;

  factory LoginResponse.fromJson(Map<String, dynamic> jsonSerialization) {
    return LoginResponse(token: jsonSerialization['token'] as String);
  }

  String token;

  LoginResponse copyWith({String? token});
  @override
  Map<String, dynamic> toJson() {
    return {'token': token};
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _LoginResponseImpl extends LoginResponse {
  _LoginResponseImpl({required String token}) : super._(token: token);

  @override
  LoginResponse copyWith({String? token}) {
    return LoginResponse(token: token ?? this.token);
  }
}
