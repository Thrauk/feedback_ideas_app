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

abstract class ActivationCode
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  ActivationCode._({
    required this.userUuid,
    required this.activationCode,
    required this.expiryDate,
    required this.isUsed,
  });

  factory ActivationCode({
    required String userUuid,
    required String activationCode,
    required DateTime expiryDate,
    required bool isUsed,
  }) = _ActivationCodeImpl;

  factory ActivationCode.fromJson(Map<String, dynamic> jsonSerialization) {
    return ActivationCode(
      userUuid: jsonSerialization['userUuid'] as String,
      activationCode: jsonSerialization['activationCode'] as String,
      expiryDate:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['expiryDate']),
      isUsed: jsonSerialization['isUsed'] as bool,
    );
  }

  String userUuid;

  String activationCode;

  DateTime expiryDate;

  bool isUsed;

  ActivationCode copyWith({
    String? userUuid,
    String? activationCode,
    DateTime? expiryDate,
    bool? isUsed,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'userUuid': userUuid,
      'activationCode': activationCode,
      'expiryDate': expiryDate.toJson(),
      'isUsed': isUsed,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'userUuid': userUuid,
      'activationCode': activationCode,
      'expiryDate': expiryDate.toJson(),
      'isUsed': isUsed,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _ActivationCodeImpl extends ActivationCode {
  _ActivationCodeImpl({
    required String userUuid,
    required String activationCode,
    required DateTime expiryDate,
    required bool isUsed,
  }) : super._(
          userUuid: userUuid,
          activationCode: activationCode,
          expiryDate: expiryDate,
          isUsed: isUsed,
        );

  @override
  ActivationCode copyWith({
    String? userUuid,
    String? activationCode,
    DateTime? expiryDate,
    bool? isUsed,
  }) {
    return ActivationCode(
      userUuid: userUuid ?? this.userUuid,
      activationCode: activationCode ?? this.activationCode,
      expiryDate: expiryDate ?? this.expiryDate,
      isUsed: isUsed ?? this.isUsed,
    );
  }
}
