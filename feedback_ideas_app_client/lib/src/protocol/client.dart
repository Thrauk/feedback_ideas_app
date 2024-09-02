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
import 'package:feedback_ideas_app_client/src/protocol/ideas/idea.dart' as _i3;
import 'package:feedback_ideas_app_client/src/protocol/ideas/idea%20extended.dart'
    as _i4;
import 'package:feedback_ideas_app_client/src/protocol/auth/login_response.dart'
    as _i5;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i6;
import 'protocol.dart' as _i7;

/// {@category Endpoint}
class EndpointIdea extends _i1.EndpointRef {
  EndpointIdea(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'idea';

  _i2.Future<bool> postIdea({
    required String title,
    required String content,
  }) =>
      caller.callServerEndpoint<bool>(
        'idea',
        'postIdea',
        {
          'title': title,
          'content': content,
        },
      );

  _i2.Future<bool> voteIdea({required String ideaUuid}) =>
      caller.callServerEndpoint<bool>(
        'idea',
        'voteIdea',
        {'ideaUuid': ideaUuid},
      );

  _i2.Future<List<_i3.Idea>> getLoggedUserIdeas() =>
      caller.callServerEndpoint<List<_i3.Idea>>(
        'idea',
        'getLoggedUserIdeas',
        {},
      );

  _i2.Future<List<_i4.IdeaExtended>> getIdeas({
    required String sortBy,
    required int sortOrder,
  }) =>
      caller.callServerEndpoint<List<_i4.IdeaExtended>>(
        'idea',
        'getIdeas',
        {
          'sortBy': sortBy,
          'sortOrder': sortOrder,
        },
      );
}

/// {@category Endpoint}
class EndpointUser extends _i1.EndpointRef {
  EndpointUser(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'user';

  _i2.Future<bool> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) =>
      caller.callServerEndpoint<bool>(
        'user',
        'register',
        {
          'email': email,
          'password': password,
          'firstName': firstName,
          'lastName': lastName,
        },
      );

  _i2.Future<_i5.LoginResponse> login({
    required String email,
    required String password,
  }) =>
      caller.callServerEndpoint<_i5.LoginResponse>(
        'user',
        'login',
        {
          'email': email,
          'password': password,
        },
      );

  /// TODO: invalidate the code after the usage
  _i2.Future<bool> activateAccount({required String activationCode}) =>
      caller.callServerEndpoint<bool>(
        'user',
        'activateAccount',
        {'activationCode': activationCode},
      );
}

class _Modules {
  _Modules(Client client) {
    auth = _i6.Caller(client);
  }

  late final _i6.Caller auth;
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
          _i7.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
        ) {
    idea = EndpointIdea(this);
    user = EndpointUser(this);
    modules = _Modules(this);
  }

  late final EndpointIdea idea;

  late final EndpointUser user;

  late final _Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'idea': idea,
        'user': user,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
