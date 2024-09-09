import 'package:feedback_ideas_app_server/src/generated/protocol.dart';
import 'package:feedback_ideas_app_server/src/repository/auth/activation_code_repository.dart';
import 'package:feedback_ideas_app_server/src/repository/auth/jwt_repository.dart';
import 'package:feedback_ideas_app_server/src/repository/auth/smtp_repository.dart';
import 'package:feedback_ideas_app_server/src/repository/idea/idea_repository.dart';
import 'package:feedback_ideas_app_server/src/repository/user/user_repository.dart';
import 'package:feedback_ideas_app_server/src/services/sqlite_service.dart';
import 'package:feedback_ideas_app_server/src/services/sqlite_utils.dart';
import 'package:feedback_ideas_app_server/src/utils/authentication_info_exteded.dart';
import 'package:serverpod/serverpod.dart';

class IdeaEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<bool> postIdea(
    Session session, {
    required String title,
    required String content,
  }) async {
    try {
      /// If the user is logged, it should not trigger a null error. Test this behaviour! ToDO(bosmang)
      final authInfo = (await session.authenticated)! as AuthenticationInfoExteded;
      final currentUserUuid = authInfo.userUuid;

      IdeaRepository().postIdea(
        authorUuid: currentUserUuid,
        title: title,
        content: content,
      );
    } catch (e) {
      print(e);
      return false;
    }

    return true;
  }

  Future<bool> voteIdea(
    Session session, {
    required String ideaUuid,
  }) async {
    try {
      final authInfo = (await session.authenticated)! as AuthenticationInfoExteded;
      final currentUserUuid = authInfo.userUuid;

      IdeaRepository().voteIdea(
        userUuid: currentUserUuid,
        ideaUuid: ideaUuid,
      );
    } catch (e) {
      print(e);
      return false;
    }

    return true;
  }

  Future<bool> removeVote(
    Session session, {
    required String ideaUuid,
  }) async {
    try {
      final authInfo = (await session.authenticated)! as AuthenticationInfoExteded;
      final currentUserUuid = authInfo.userUuid;

      IdeaRepository().removeVote(
        userUuid: currentUserUuid,
        ideaUuid: ideaUuid,
      );
    } catch (e) {
      print(e);
      return false;
    }

    return true;
  }

  Future<List<Idea>> getLoggedUserIdeas(Session session) async {
    final authInfo = (await session.authenticated)! as AuthenticationInfoExteded;
    final currentUserUuid = authInfo.userUuid;
    return IdeaRepository().getIdeasByAuthorUuid(authorUuid: currentUserUuid);
  }

  Future<List<IdeaExtended>> getIdeas(
    Session session, {
    String sortBy = 'postedAt',
    int sortOrder = 1,
  }) async {
    final authInfo = (await session.authenticated)! as AuthenticationInfoExteded;
    final currentUserUuid = authInfo.userUuid;
    return IdeaRepository().getIdeas(
      currentUserUuid: currentUserUuid,
      orderBy: SqlOrderBy(
        key: sortBy,
        orderType: sortOrder == 0 ? SqlOrderType.ascending : SqlOrderType.descending,
      ),
    );
  }
}
