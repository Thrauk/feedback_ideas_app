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
import 'auth/exceptions/activate_account/activate_account_exception.dart'
    as _i4;
import 'auth/exceptions/activate_account/activate_account_exception_type.dart'
    as _i5;
import 'auth/exceptions/login/login_exception.dart' as _i6;
import 'auth/exceptions/login/login_exception_type.dart' as _i7;
import 'auth/exceptions/register/register_exception.dart' as _i8;
import 'auth/exceptions/register/register_exception_type.dart' as _i9;
import 'auth/jwt_payload.dart' as _i10;
import 'auth/login_response.dart' as _i11;
import 'user/user.dart' as _i12;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i13;
export 'auth/activation_code.dart';
export 'auth/auth_error.dart';
export 'auth/exceptions/activate_account/activate_account_exception.dart';
export 'auth/exceptions/activate_account/activate_account_exception_type.dart';
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
    if (t == _i4.ActiveAccountException) {
      return _i4.ActiveAccountException.fromJson(data) as T;
    }
    if (t == _i5.ActiveAccountExceptionType) {
      return _i5.ActiveAccountExceptionType.fromJson(data) as T;
    }
    if (t == _i6.LoginException) {
      return _i6.LoginException.fromJson(data) as T;
    }
    if (t == _i7.LoginExceptionType) {
      return _i7.LoginExceptionType.fromJson(data) as T;
    }
    if (t == _i8.RegisterException) {
      return _i8.RegisterException.fromJson(data) as T;
    }
    if (t == _i9.RegisterExceptionType) {
      return _i9.RegisterExceptionType.fromJson(data) as T;
    }
    if (t == _i10.JwtPayload) {
      return _i10.JwtPayload.fromJson(data) as T;
    }
    if (t == _i11.LoginResponse) {
      return _i11.LoginResponse.fromJson(data) as T;
    }
    if (t == _i12.User) {
      return _i12.User.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.ActivationCode?>()) {
      return (data != null ? _i2.ActivationCode.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.AuthError?>()) {
      return (data != null ? _i3.AuthError.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.ActiveAccountException?>()) {
      return (data != null ? _i4.ActiveAccountException.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i5.ActiveAccountExceptionType?>()) {
      return (data != null
          ? _i5.ActiveAccountExceptionType.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i6.LoginException?>()) {
      return (data != null ? _i6.LoginException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.LoginExceptionType?>()) {
      return (data != null ? _i7.LoginExceptionType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.RegisterException?>()) {
      return (data != null ? _i8.RegisterException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.RegisterExceptionType?>()) {
      return (data != null ? _i9.RegisterExceptionType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i10.JwtPayload?>()) {
      return (data != null ? _i10.JwtPayload.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.LoginResponse?>()) {
      return (data != null ? _i11.LoginResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.User?>()) {
      return (data != null ? _i12.User.fromJson(data) : null) as T;
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
      return _i13.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    String? className;
    className = _i13.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    if (data is _i2.ActivationCode) {
      return 'ActivationCode';
    }
    if (data is _i3.AuthError) {
      return 'AuthError';
    }
    if (data is _i4.ActiveAccountException) {
      return 'ActiveAccountException';
    }
    if (data is _i5.ActiveAccountExceptionType) {
      return 'ActiveAccountExceptionType';
    }
    if (data is _i6.LoginException) {
      return 'LoginException';
    }
    if (data is _i7.LoginExceptionType) {
      return 'LoginExceptionType';
    }
    if (data is _i8.RegisterException) {
      return 'RegisterException';
    }
    if (data is _i9.RegisterExceptionType) {
      return 'RegisterExceptionType';
    }
    if (data is _i10.JwtPayload) {
      return 'JwtPayload';
    }
    if (data is _i11.LoginResponse) {
      return 'LoginResponse';
    }
    if (data is _i12.User) {
      return 'User';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i13.Protocol().deserializeByClassName(data);
    }
    if (data['className'] == 'ActivationCode') {
      return deserialize<_i2.ActivationCode>(data['data']);
    }
    if (data['className'] == 'AuthError') {
      return deserialize<_i3.AuthError>(data['data']);
    }
    if (data['className'] == 'ActiveAccountException') {
      return deserialize<_i4.ActiveAccountException>(data['data']);
    }
    if (data['className'] == 'ActiveAccountExceptionType') {
      return deserialize<_i5.ActiveAccountExceptionType>(data['data']);
    }
    if (data['className'] == 'LoginException') {
      return deserialize<_i6.LoginException>(data['data']);
    }
    if (data['className'] == 'LoginExceptionType') {
      return deserialize<_i7.LoginExceptionType>(data['data']);
    }
    if (data['className'] == 'RegisterException') {
      return deserialize<_i8.RegisterException>(data['data']);
    }
    if (data['className'] == 'RegisterExceptionType') {
      return deserialize<_i9.RegisterExceptionType>(data['data']);
    }
    if (data['className'] == 'JwtPayload') {
      return deserialize<_i10.JwtPayload>(data['data']);
    }
    if (data['className'] == 'LoginResponse') {
      return deserialize<_i11.LoginResponse>(data['data']);
    }
    if (data['className'] == 'User') {
      return deserialize<_i12.User>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
