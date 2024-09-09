/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/idea_endpoint.dart' as _i2;
import '../endpoints/user_endpoint.dart' as _i3;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i4;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'idea': _i2.IdeaEndpoint()
        ..initialize(
          server,
          'idea',
          null,
        ),
      'user': _i3.UserEndpoint()
        ..initialize(
          server,
          'user',
          null,
        ),
    };
    connectors['idea'] = _i1.EndpointConnector(
      name: 'idea',
      endpoint: endpoints['idea']!,
      methodConnectors: {
        'postIdea': _i1.MethodConnector(
          name: 'postIdea',
          params: {
            'title': _i1.ParameterDescription(
              name: 'title',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'content': _i1.ParameterDescription(
              name: 'content',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['idea'] as _i2.IdeaEndpoint).postIdea(
            session,
            title: params['title'],
            content: params['content'],
          ),
        ),
        'voteIdea': _i1.MethodConnector(
          name: 'voteIdea',
          params: {
            'ideaUuid': _i1.ParameterDescription(
              name: 'ideaUuid',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['idea'] as _i2.IdeaEndpoint).voteIdea(
            session,
            ideaUuid: params['ideaUuid'],
          ),
        ),
        'removeVote': _i1.MethodConnector(
          name: 'removeVote',
          params: {
            'ideaUuid': _i1.ParameterDescription(
              name: 'ideaUuid',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['idea'] as _i2.IdeaEndpoint).removeVote(
            session,
            ideaUuid: params['ideaUuid'],
          ),
        ),
        'getLoggedUserIdeas': _i1.MethodConnector(
          name: 'getLoggedUserIdeas',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['idea'] as _i2.IdeaEndpoint)
                  .getLoggedUserIdeas(session),
        ),
        'getIdeas': _i1.MethodConnector(
          name: 'getIdeas',
          params: {
            'sortBy': _i1.ParameterDescription(
              name: 'sortBy',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'sortOrder': _i1.ParameterDescription(
              name: 'sortOrder',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['idea'] as _i2.IdeaEndpoint).getIdeas(
            session,
            sortBy: params['sortBy'],
            sortOrder: params['sortOrder'],
          ),
        ),
      },
    );
    connectors['user'] = _i1.EndpointConnector(
      name: 'user',
      endpoint: endpoints['user']!,
      methodConnectors: {
        'register': _i1.MethodConnector(
          name: 'register',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'firstName': _i1.ParameterDescription(
              name: 'firstName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'lastName': _i1.ParameterDescription(
              name: 'lastName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i3.UserEndpoint).register(
            session,
            email: params['email'],
            password: params['password'],
            firstName: params['firstName'],
            lastName: params['lastName'],
          ),
        ),
        'login': _i1.MethodConnector(
          name: 'login',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i3.UserEndpoint).login(
            session,
            email: params['email'],
            password: params['password'],
          ),
        ),
        'activateAccount': _i1.MethodConnector(
          name: 'activateAccount',
          params: {
            'activationCode': _i1.ParameterDescription(
              name: 'activationCode',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i3.UserEndpoint).activateAccount(
            session,
            activationCode: params['activationCode'],
          ),
        ),
      },
    );
    modules['serverpod_auth'] = _i4.Endpoints()..initializeEndpoints(server);
  }
}
