/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'auth/activation_code.dart' as _i2;
import 'auth/auth_error.dart' as _i3;
import 'auth/exceptions/login/login_exception.dart' as _i4;
import 'auth/exceptions/login/login_exception_type.dart' as _i5;
import 'auth/exceptions/register/register_exception.dart' as _i6;
import 'auth/exceptions/register/register_exception_type.dart' as _i7;
import 'auth/jwt_payload.dart' as _i8;
import 'auth/login_response.dart' as _i9;
import 'user/user.dart' as _i10;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i11;
export 'auth/activation_code.dart';
export 'auth/auth_error.dart';
export 'auth/exceptions/login/login_exception.dart';
export 'auth/exceptions/login/login_exception_type.dart';
export 'auth/exceptions/register/register_exception.dart';
export 'auth/exceptions/register/register_exception_type.dart';
export 'auth/jwt_payload.dart';
export 'auth/login_response.dart';
export 'user/user.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.ActivationCode) {
      return _i2.ActivationCode.fromJson(data) as T;
    }
    if (t == _i3.AuthError) {
      return _i3.AuthError.fromJson(data) as T;
    }
    if (t == _i4.LoginException) {
      return _i4.LoginException.fromJson(data) as T;
    }
    if (t == _i5.LoginExceptionType) {
      return _i5.LoginExceptionType.fromJson(data) as T;
    }
    if (t == _i6.RegisterException) {
      return _i6.RegisterException.fromJson(data) as T;
    }
    if (t == _i7.RegisterExceptionType) {
      return _i7.RegisterExceptionType.fromJson(data) as T;
    }
    if (t == _i8.JwtPayload) {
      return _i8.JwtPayload.fromJson(data) as T;
    }
    if (t == _i9.LoginResponse) {
      return _i9.LoginResponse.fromJson(data) as T;
    }
    if (t == _i10.User) {
      return _i10.User.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.ActivationCode?>()) {
      return (data != null ? _i2.ActivationCode.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.AuthError?>()) {
      return (data != null ? _i3.AuthError.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.LoginException?>()) {
      return (data != null ? _i4.LoginException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.LoginExceptionType?>()) {
      return (data != null ? _i5.LoginExceptionType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.RegisterException?>()) {
      return (data != null ? _i6.RegisterException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.RegisterExceptionType?>()) {
      return (data != null ? _i7.RegisterExceptionType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i8.JwtPayload?>()) {
      return (data != null ? _i8.JwtPayload.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.LoginResponse?>()) {
      return (data != null ? _i9.LoginResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.User?>()) {
      return (data != null ? _i10.User.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<Map<String, String>?>()) {
      return (data != null
          ? (data as Map).map((k, v) =>
              MapEntry(deserialize<String>(k), deserialize<String>(v)))
          : null) as dynamic;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList()
          as dynamic;
    }
    try {
      return _i11.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    String? className;
    className = _i11.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    if (data is _i2.ActivationCode) {
      return 'ActivationCode';
    }
    if (data is _i3.AuthError) {
      return 'AuthError';
    }
    if (data is _i4.LoginException) {
      return 'LoginException';
    }
    if (data is _i5.LoginExceptionType) {
      return 'LoginExceptionType';
    }
    if (data is _i6.RegisterException) {
      return 'RegisterException';
    }
    if (data is _i7.RegisterExceptionType) {
      return 'RegisterExceptionType';
    }
    if (data is _i8.JwtPayload) {
      return 'JwtPayload';
    }
    if (data is _i9.LoginResponse) {
      return 'LoginResponse';
    }
    if (data is _i10.User) {
      return 'User';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i11.Protocol().deserializeByClassName(data);
    }
    if (data['className'] == 'ActivationCode') {
      return deserialize<_i2.ActivationCode>(data['data']);
    }
    if (data['className'] == 'AuthError') {
      return deserialize<_i3.AuthError>(data['data']);
    }
    if (data['className'] == 'LoginException') {
      return deserialize<_i4.LoginException>(data['data']);
    }
    if (data['className'] == 'LoginExceptionType') {
      return deserialize<_i5.LoginExceptionType>(data['data']);
    }
    if (data['className'] == 'RegisterException') {
      return deserialize<_i6.RegisterException>(data['data']);
    }
    if (data['className'] == 'RegisterExceptionType') {
      return deserialize<_i7.RegisterExceptionType>(data['data']);
    }
    if (data['className'] == 'JwtPayload') {
      return deserialize<_i8.JwtPayload>(data['data']);
    }
    if (data['className'] == 'LoginResponse') {
      return deserialize<_i9.LoginResponse>(data['data']);
    }
    if (data['className'] == 'User') {
      return deserialize<_i10.User>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
