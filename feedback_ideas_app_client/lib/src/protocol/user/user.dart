/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class User implements _i1.SerializableModel {
  User._({
    this.id,
    required this.uuid,
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.isActivated,
  });

  factory User({
    int? id,
    required String uuid,
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required int isActivated,
  }) = _UserImpl;

  factory User.fromJson(Map<String, dynamic> jsonSerialization) {
    return User(
      id: jsonSerialization['id'] as int?,
      uuid: jsonSerialization['uuid'] as String,
      email: jsonSerialization['email'] as String,
      password: jsonSerialization['password'] as String,
      firstName: jsonSerialization['firstName'] as String,
      lastName: jsonSerialization['lastName'] as String,
      isActivated: jsonSerialization['isActivated'] as int,
    );
  }

  int? id;

  String uuid;

  String email;

  String password;

  String firstName;

  String lastName;

  int isActivated;

  User copyWith({
    int? id,
    String? uuid,
    String? email,
    String? password,
    String? firstName,
    String? lastName,
    int? isActivated,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'uuid': uuid,
      'email': email,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      'isActivated': isActivated,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserImpl extends User {
  _UserImpl({
    int? id,
    required String uuid,
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required int isActivated,
  }) : super._(
          id: id,
          uuid: uuid,
          email: email,
          password: password,
          firstName: firstName,
          lastName: lastName,
          isActivated: isActivated,
        );

  @override
  User copyWith({
    Object? id = _Undefined,
    String? uuid,
    String? email,
    String? password,
    String? firstName,
    String? lastName,
    int? isActivated,
  }) {
    return User(
      id: id is int? ? id : this.id,
      uuid: uuid ?? this.uuid,
      email: email ?? this.email,
      password: password ?? this.password,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      isActivated: isActivated ?? this.isActivated,
    );
  }
}
