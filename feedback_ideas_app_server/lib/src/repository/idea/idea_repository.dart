import 'package:feedback_ideas_app_server/src/constants/database_constants.dart';
import 'package:feedback_ideas_app_server/src/generated/protocol.dart';
import 'package:feedback_ideas_app_server/src/repository/auth/activation_code_repository.dart';
import 'package:feedback_ideas_app_server/src/services/sqlite_service.dart';
import 'package:uuid/uuid.dart';

class IdeaRepository {
  static final IdeaRepository _singleton = IdeaRepository._internal();
  late final SqliteService _sqliteService;
  static const String _idColumnName = 'id';
  static const String _emailColumnName = 'email';
  static const String _passwordColumName = 'password';

  factory IdeaRepository() {
    return _singleton;
  }

  IdeaRepository._internal() {
    _sqliteService = SqliteService();
  }

  Idea? postIdea({
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

    final result = _sqliteService.insertIntoTable(
      table: DatabaseConstants.userTable,
      data: newIdeaData,
      returnValue: true,
    );

    // final processedResult = Map<String, dynamic>.from(result!);
    // processedResult['isActivated'] = processedResult['isActivated'] == 1;

    // try {
    //   return User.fromJson(result!);
    // } catch (e) {
    //   print(e);
    //   return null;
    // }
  }

  bool activateUserByCode(String activationCode) {
    final activationCodeData = ActivationCodeRepository().getActivationCodeByCode(activationCode);
    if (activationCodeData == null) {
      return false;
    }

    /// Throw some errors?
    if (activationCodeData.expiryDate.isBefore(DateTime.now())) {
      return false;
    }

    /// TODO(Bosmang): throw error if code is not found
    final user = getUserByUuid(activationCodeData.userUuid);
    if (user.isActivated == true) {
      return false;
    }

    _sqliteService.updateTableValue(
      table: DatabaseConstants.userTable,
      updateValues: {
        'isActivated': 1,
      },
      conditions: {
        'uuid': user.uuid,
      },
    );
    return true;
  }

  User getUserByEmail(String email) {
    final queryResult = SqliteService().queryRowByConditions(
      tableName: DatabaseConstants.userTable,
      conditions: {
        _emailColumnName: email,
      },
    );
    // TODO(bosmang): adjust errors for null safety
    return User.fromJson(queryResult!);
  }

  User getUserByUuid(String uuid) {
    final queryResult = SqliteService().queryRowByConditions(
      tableName: DatabaseConstants.userTable,
      conditions: {
        'uuid': uuid,
      },
    );
    // TODO(bosmang): adjust errors for null safety
    return User.fromJson(queryResult!);
  }

  // Depracate? TODO(bosmang)
  String? getUserUuidByEmail(String email) {
    final String? uuid = SqliteService().queryValueByCondition(
      tableName: DatabaseConstants.userTable,
      targetColumn: 'uuid',
      columnCondition: 'email',
      valueCondition: email,
    ) as String?;
    return uuid;
  }

  /// Replace with the multi query method. Depracate? TODO(bosmang)
  int? getUserIdByEmail(String email) {
    return SqliteService().queryValueByCondition(
      tableName: DatabaseConstants.userTable,
      targetColumn: 'id',
      columnCondition: 'email',
      valueCondition: email,
    ) as int?;
  }

  bool checkUserPassword({required String email, required String password}) {
    return _sqliteService.checkIfMultipleValuesExists(
      tableName: DatabaseConstants.userTable,
      conditions: {
        _emailColumnName: email,
        _passwordColumName: password,
      },
    );
  }

  bool _checkIfEmailExists(String email) {
    return _sqliteService.checkIfValueExists(
      tableName: DatabaseConstants.userTable,
      columnName: _emailColumnName,
      value: email,
    );
  }
}
