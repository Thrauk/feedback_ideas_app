/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:feedback_ideas_app_client/src/protocol/auth/login_response.dart'
    as _i3;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i4;
import 'protocol.dart' as _i5;

/// {@category Endpoint}
class EndpointExample extends _i1.EndpointRef {
  EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
      );
}

/// {@category Endpoint}
class EndpointUserEndpoit extends _i1.EndpointRef {
  EndpointUserEndpoit(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'userEndpoit';

  _i2.Future<bool> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) =>
      caller.callServerEndpoint<bool>(
        'userEndpoit',
        'register',
        {
          'email': email,
          'password': password,
          'firstName': firstName,
          'lastName': lastName,
        },
      );

  _i2.Future<_i3.LoginResponse> login({
    required String email,
    required String password,
  }) =>
      caller.callServerEndpoint<_i3.LoginResponse>(
        'userEndpoit',
        'login',
        {
          'email': email,
          'password': password,
        },
      );
}

class _Modules {
  _Modules(Client client) {
    auth = _i4.Caller(client);
  }

  late final _i4.Caller auth;
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
  }) : super(
          host,
          _i5.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
        ) {
    example = EndpointExample(this);
    userEndpoit = EndpointUserEndpoit(this);
    modules = _Modules(this);
  }

  late final EndpointExample example;

  late final EndpointUserEndpoit userEndpoit;

  late final _Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'example': example,
        'userEndpoit': userEndpoit,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
