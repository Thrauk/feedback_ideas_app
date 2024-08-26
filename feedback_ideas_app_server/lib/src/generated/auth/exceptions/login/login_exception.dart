/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../../../protocol.dart' as _i2;
import 'package:serverpod_serialization/serverpod_serialization.dart';

abstract class LoginException
    implements
        _i1.SerializableException,
        _i1.SerializableModel,
        _i1.ProtocolSerialization {
  LoginException._({
    required this.message,
    required this.type,
    this.extra,
  });

  factory LoginException({
    required String message,
    required _i2.LoginExceptionType type,
    Map<String, String>? extra,
  }) = _LoginExceptionImpl;

  factory LoginException.fromJson(Map<String, dynamic> jsonSerialization) {
    return LoginException(
      message: jsonSerialization['message'] as String,
      type: _i2.LoginExceptionType.fromJson((jsonSerialization['type'] as int)),
      extra: (jsonSerialization['extra'] as Map?)?.map((k, v) => MapEntry(
            k as String,
            v as String,
          )),
    );
  }

  String message;

  _i2.LoginExceptionType type;

  Map<String, String>? extra;

  LoginException copyWith({
    String? message,
    _i2.LoginExceptionType? type,
    Map<String, String>? extra,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'type': type.toJson(),
      if (extra != null) 'extra': extra?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'message': message,
      'type': type.toJson(),
      if (extra != null) 'extra': extra?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _LoginExceptionImpl extends LoginException {
  _LoginExceptionImpl({
    required String message,
    required _i2.LoginExceptionType type,
    Map<String, String>? extra,
  }) : super._(
          message: message,
          type: type,
          extra: extra,
        );

  @override
  LoginException copyWith({
    String? message,
    _i2.LoginExceptionType? type,
    Object? extra = _Undefined,
  }) {
    return LoginException(
      message: message ?? this.message,
      type: type ?? this.type,
      extra: extra is Map<String, String>? ? extra : this.extra?.clone(),
    );
  }
}
