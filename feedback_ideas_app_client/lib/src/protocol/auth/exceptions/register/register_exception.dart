/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../../../protocol.dart' as _i2;

abstract class RegisterException
    implements _i1.SerializableException, _i1.SerializableModel {
  RegisterException._({
    required this.message,
    required this.type,
  });

  factory RegisterException({
    required String message,
    required _i2.RegisterExceptionType type,
  }) = _RegisterExceptionImpl;

  factory RegisterException.fromJson(Map<String, dynamic> jsonSerialization) {
    return RegisterException(
      message: jsonSerialization['message'] as String,
      type: _i2.RegisterExceptionType.fromJson(
          (jsonSerialization['type'] as int)),
    );
  }

  String message;

  _i2.RegisterExceptionType type;

  RegisterException copyWith({
    String? message,
    _i2.RegisterExceptionType? type,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'type': type.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _RegisterExceptionImpl extends RegisterException {
  _RegisterExceptionImpl({
    required String message,
    required _i2.RegisterExceptionType type,
  }) : super._(
          message: message,
          type: type,
        );

  @override
  RegisterException copyWith({
    String? message,
    _i2.RegisterExceptionType? type,
  }) {
    return RegisterException(
      message: message ?? this.message,
      type: type ?? this.type,
    );
  }
}
