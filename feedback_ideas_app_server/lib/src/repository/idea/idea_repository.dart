import 'package:feedback_ideas_app_server/src/constants/database_constants.dart';
import 'package:feedback_ideas_app_server/src/generated/protocol.dart';
import 'package:feedback_ideas_app_server/src/services/sqlite_service.dart';
import 'package:feedback_ideas_app_server/src/services/sqlite_utils.dart';
import 'package:uuid/uuid.dart';

class IdeaRepository {
  static final IdeaRepository _singleton = IdeaRepository._internal();
  late final SqliteService _sqliteService;
  static const String _idColumnName = 'id';

  factory IdeaRepository() {
    return _singleton;
  }

  IdeaRepository._internal() {
    _sqliteService = SqliteService();
  }

  void postIdea({
    required String authorUuid,
    required String title,
    required String content,
  }) {
    final String uuid = Uuid().v1();

    final Idea newIdea = Idea(
      uuid: uuid,
      postedAt: DateTime.now(),
      title: title,
      content: content,
      authorUuid: authorUuid,
      votesNumber: 0,
      commentsNumber: 0,
    );

    final newIdeaData = newIdea.toJson();
    newIdeaData.remove(_idColumnName);

    _sqliteService.insertIntoTable(
      table: DatabaseConstants.ideaTable,
      data: newIdeaData,
    );
  }

  List<Idea> getIdeasByAuthorUuid({
    required String authorUuid,
  }) {
    final queryResult = _sqliteService.selectAll(
      tableName: DatabaseConstants.ideaTable,
      conditions: {
        'authorUuid': authorUuid,
      },
      orderBy: SqlOrderBy(
        key: 'postedAt',
        orderType: SqlOrderType.descending,
      ),
    );
    final List<Idea> ideas = queryResult
        .map(
          (item) => Idea.fromJson(item),
        )
        .toList();
    return ideas;
  }

  List<IdeaExtended> getIdeas({
    SqlOrderBy? orderBy,
    String? searchQuery,
  }) {
    final queryResult = _sqliteService.selectSingleJoin(
      tableName: DatabaseConstants.ideaTable,
      joinTable: DatabaseConstants.userTable,
      joinTableFields: [
        SqlJoinTableField(
          fieldName: 'firstName',
          alias: 'authorFirstName',
        ),
        SqlJoinTableField(
          fieldName: 'lastName',
          alias: 'authorLastName',
        ),
      ],
      joinConditions: {
        'authorUuid': 'uuid',
      },
      orderBy: orderBy,
    );
    final List<IdeaExtended> ideas = queryResult
        .map(
          (item) => IdeaExtended.fromJson(item),
        )
        .toList();
    return ideas;
  }
}
