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

abstract class ActiveAccountException
    implements
        _i1.SerializableException,
        _i1.SerializableModel,
        _i1.ProtocolSerialization {
  ActiveAccountException._({
    required this.message,
    required this.type,
  });

  factory ActiveAccountException({
    required String message,
    required _i2.ActiveAccountExceptionType type,
  }) = _ActiveAccountExceptionImpl;

  factory ActiveAccountException.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return ActiveAccountException(
      message: jsonSerialization['message'] as String,
      type: _i2.ActiveAccountExceptionType.fromJson(
          (jsonSerialization['type'] as int)),
    );
  }

  String message;

  _i2.ActiveAccountExceptionType type;

  ActiveAccountException copyWith({
    String? message,
    _i2.ActiveAccountExceptionType? type,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'type': type.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
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

class _ActiveAccountExceptionImpl extends ActiveAccountException {
  _ActiveAccountExceptionImpl({
    required String message,
    required _i2.ActiveAccountExceptionType type,
  }) : super._(
          message: message,
          type: type,
        );

  @override
  ActiveAccountException copyWith({
    String? message,
    _i2.ActiveAccountExceptionType? type,
  }) {
    return ActiveAccountException(
      message: message ?? this.message,
      type: type ?? this.type,
    );
  }
}
