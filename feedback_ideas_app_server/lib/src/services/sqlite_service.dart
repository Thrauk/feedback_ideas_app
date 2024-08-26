import 'package:feedback_ideas_app_server/src/constants/database_constants.dart';
import 'package:sqlite3/sqlite3.dart';

class SqliteService {
  static late final SqliteService _singleton; // = SqliteService._internal();
  final Database _db;

  factory SqliteService() {
    return _singleton;
  }

  static void initialize({
    required String databasePath,
  }) {
    final Database database = sqlite3.open(
      databasePath,
    );

    if (!_checkIfTableExists(DatabaseConstants.userTable, database)) {
      _createUsersTable(database);
    }
    if (!_checkIfTableExists(DatabaseConstants.activationCodeTable, database)) {
      _createActivationCodesTable(database);
    }

    _singleton = SqliteService._internal(
      database: database,
    );
  }

  SqliteService._internal({
    required Database database,
  }) : _db = database;

  static bool _checkIfTableExists(String tableName, Database database) {
    final ResultSet result = database.select("SELECT name FROM sqlite_master WHERE type='table' AND name='$tableName';");
    return result.length == 1;
  }

  static void _createUsersTable(Database database) {
    database.execute(
      DatabaseConstants.createUserTableQuery,
    );
  }

  static void _createActivationCodesTable(Database database) {
    database.execute(
      DatabaseConstants.createActivationCodeTableQuery,
    );
  }

  Row? insertIntoTable({
    required String table,
    required Map<String, dynamic> data,
    bool returnValue = false,
  }) {
    /// Should throw some error back or return some value. Must modify later.
    if (data.isEmpty) {
      return null;
    }
    final keys = data.keys.toList();
    final values = data.values.toList();
    final keysStatement = keys.join(',');
    final valuesStatement = List.filled(values.length, '?').join(',');
    final String statementString = '''
      INSERT INTO $table ($keysStatement) VALUES ($valuesStatement)${returnValue ? ' RETURNING *' : ''}
    ''';
    final statement = _db.prepare(statementString);
    if (returnValue) {
      final results = statement.selectWith(StatementParameters(values));
      return results.firstOrNull;
    } else {
      statement.execute(values);
    }
    statement.dispose();
    return null;
  }

  bool checkIfValueExists({
    required String tableName,
    required String columnName,
    required dynamic value,
  }) {
    final result = queryDatabase("SELECT * FROM $tableName WHERE $columnName='$value'");
    return result.isNotEmpty;
  }

  bool checkIfMultipleValuesExists({
    required String tableName,
    required Map<String, dynamic> conditions,
  }) {
    final String conditionsString = conditions.entries.map((entry) => "${entry.key}='${entry.value}'").join(' AND ');
    final result = queryDatabase("SELECT * FROM $tableName WHERE ($conditionsString)");
    return result.isNotEmpty;
  }

  Row? queryRowByConditions({
    required String tableName,
    required Map<String, dynamic> conditions,
  }) {
    final String conditionsString = conditions.entries.map((entry) => "${entry.key}='${entry.value}'").join(' AND ');
    final result = queryDatabase("SELECT * FROM $tableName WHERE ($conditionsString)");
    return result.firstOrNull;
  }

  dynamic queryValueByCondition({
    required String tableName,
    required String targetColumn,
    required String columnCondition,
    required dynamic valueCondition,
  }) {
    final result = queryDatabase("SELECT $targetColumn FROM $tableName WHERE $columnCondition='$valueCondition'");
    return result.firstOrNull?[targetColumn];
  }

  dynamic queryMultipleValuesByCondition({
    required String tableName,
    required List<String> targetColumns,
    required Map<String, dynamic> conditions,
  }) {
    final String conditionsString = conditions.entries.map((entry) => "${entry.key}='${entry.value}'").join(' AND ');
    final String targetColumnsString = targetColumns.join(',');
    final queryResultAll = queryDatabase("SELECT $targetColumnsString FROM $tableName WHERE ($conditionsString)");
    final queryResult = queryResultAll.firstOrNull;
    return {for (var column in targetColumns) column: queryResult?[column]};
  }

  ResultSet queryDatabase(String query) {
    final ResultSet queryResult = _db.select(query);
    return queryResult;
  }

  static void close() {
    _singleton._db.dispose();
  }
}
