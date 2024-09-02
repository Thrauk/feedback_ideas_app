import 'package:feedback_ideas_app_server/src/constants/database_constants.dart';
import 'package:feedback_ideas_app_server/src/services/sqlite_query_helper.dart';
import 'package:feedback_ideas_app_server/src/services/sqlite_utils.dart';
import 'package:feedback_ideas_app_server/src/test_data/test_data_loader.dart';
import 'package:sqlite3/sqlite3.dart';

class SqliteService {
  static late final SqliteService _singleton; // = SqliteService._internal();
  final Database _db;

  factory SqliteService() {
    return _singleton;
  }

  static Future<void> initialize({
    required String databasePath,
  }) async {
    final Database database = sqlite3.open(
      databasePath,
    );

    for (String table in DatabaseConstants.creationQueries.keys) {
      if (!_checkIfTableExists(table, database)) {
        database.execute(
          DatabaseConstants.creationQueries[table]!,
        );
        TestDataLoader.loadDevelopmentData(table);
      }
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

  /// Inserts a row into a table. If [returnValue] is set to true, the inserted Row is going to be returned.
  /// Todo(bosmang): Verify if the data has a good format.
  /// Todo(bosmang): Only sqlite_service should know about Row data type. Modify in other places.
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

  void updateTableValue({
    required String table,
    required Map<String, dynamic> updateValues,
    required Map<String, dynamic> conditions,
  }) {
    final setStatement = updateValues.entries.map((entry) => "${entry.key}='${entry.value}'").join(',');
    final conditionsStatement = conditions.entries.map((entry) => "${entry.key}='${entry.value}'").join(' AND ');
    final String statementString = '''
      UPDATE $table SET $setStatement WHERE $conditionsStatement
    ''';
    final statement = _db.prepare(statementString);
    statement.execute();
    statement.dispose();
  }

  /// Check if there are rows that meet exactly one condition
  bool checkIfValueExists({
    required String tableName,
    required String columnName,
    required dynamic value,
  }) {
    final result = queryDatabase("SELECT * FROM $tableName WHERE $columnName='$value'");
    return result.isNotEmpty;
  }

  /// Check if there are any rows that meet multiple conditions.
  bool checkIfMultipleValuesExists({
    required String tableName,
    required Map<String, dynamic> conditions,
  }) {
    final String conditionsString = conditions.entries.map((entry) => "${entry.key}='${entry.value}'").join(' AND ');
    final result = queryDatabase("SELECT * FROM $tableName WHERE ($conditionsString)");
    return result.isNotEmpty;
  }

  /// Get a ROW from the DB based on one or multiple conditions.
  Row? queryRowByConditions({
    required String tableName,
    required Map<String, dynamic> conditions,
  }) {
    final String conditionsString = conditions.entries.map((entry) => "${entry.key}='${entry.value}'").join(' AND ');
    final result = queryDatabase("SELECT * FROM $tableName WHERE ($conditionsString)");
    return result.firstOrNull;
  }

  /// Get a specific value based on a single condition. TODO(bosmang): Should depracate.
  dynamic queryValueByCondition({
    required String tableName,
    required String targetColumn,
    required String columnCondition,
    required dynamic valueCondition,
  }) {
    final result = queryDatabase("SELECT $targetColumn FROM $tableName WHERE $columnCondition='$valueCondition'");
    return result.firstOrNull?[targetColumn];
  }

  /// Get multiple values by one or more conditions. This values should be casted, as they come with the dynamic type.
  Map<String, dynamic> queryMultipleValuesByCondition({
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

  List<Map<String, dynamic>> selectAll({
    required String tableName,
    Map<String, dynamic> conditions = const <String, dynamic>{},
    SqlOrderBy? orderBy,
  }) {
    final String conditionsString = conditions.entries.map((entry) => "${entry.key}='${entry.value}'").join(' AND ');
    final queryResultAll = queryDatabase(
      '''SELECT * FROM $tableName 
        ${conditions.isNotEmpty ? 'WHERE($conditionsString) ' : ''}
        ${orderBy != null ? 'ORDER BY ${orderBy.key} ${orderBy.orderType.value}' : ''}
      ''',
    );
    final queryResult = queryResultAll
        .toList()
        .map(
          (row) => Map<String, dynamic>.from(row),
        )
        .toList();
    return queryResult;
  }

  /// Old compatibility. ToDO: Delete afterwards.
  List<Map<String, dynamic>> selectSingleJoin({
    required String tableName,
    required String joinTable,
    required List<SqlJoinTableField> joinTableFields,
    required Map<String, dynamic> joinConditions,
    List<String> tableFields = const [],
    Map<String, dynamic> conditions = const <String, dynamic>{},
    SqlOrderBy? orderBy,
  }) {
    final String conditionsString = conditions.entries.map((entry) => "${entry.key}='${entry.value}'").join(' AND ');
    final String joinConditionsString =
        joinConditions.entries.map((entry) => "$tableName.${entry.key}=$joinTable.${entry.value}").join(' AND ');
    final List<String> tableFieldsFull = tableFields.map((e) => '$tableName.$e').toList();
    final List<String> joinTableFieldsFull = joinTableFields.map((field) => field.getSelectQuery(joinTable)).toList();
    final String selectString =
        '${tableFields.isEmpty ? '$tableName.*' : tableFieldsFull.join(',')},${joinTableFieldsFull.join(',')}';
    final queryResultAll = queryDatabase(
      '''SELECT 
          $selectString
        FROM $tableName
        JOIN $joinTable 
        ON $joinConditionsString
        ${conditions.isNotEmpty ? 'WHERE($conditionsString) ' : ''}
        ${orderBy != null ? 'ORDER BY $tableName.${orderBy.key} ${orderBy.orderType.value}' : ''}
      ''',
    );
    final queryResult = queryResultAll
        .toList()
        .map(
          (row) => Map<String, dynamic>.from(row),
        )
        .toList();
    return queryResult;
  }

  // Main function that handles multiple joins, conditions, fields, and ordering
  List<Map<String, dynamic>> selectWithJoins({
    required String tableName,
    required List<SqlJoin> joins,
    List<String> tableFields = const [],
    List<SqlCaseField> caseFields = const [],
    Map<String, dynamic> conditions = const <String, dynamic>{},
    SqlOrderBy? orderBy,
  }) {
    // Construct the query strings using helper methods
    final conditionsString = SqliteQueryHelper.buildConditionsString(conditions);
    final joinStatements = SqliteQueryHelper.buildJoinStatements(joins, tableName);
    final selectString = SqliteQueryHelper.buildSelectString(
      tableName,
      tableFields,
      joins,
      caseFields,
    );

    // Construct the complete SQL query
    final query = '''
    SELECT 
      $selectString
    FROM 
      $tableName
    $joinStatements
    ${conditions.isNotEmpty ? 'WHERE $conditionsString' : ''}
    ${orderBy != null ? 'ORDER BY ${orderBy.key} ${orderBy.orderType.value}' : ''}
  ''';

    // Execute the query and format the result
    final queryResultAll = queryDatabase(query);
    final queryResult = queryResultAll.map((row) => Map<String, dynamic>.from(row)).toList();

    return queryResult;
  }

  /// Execute a specific query outside the sqlite service. Might not use at all?
  ResultSet queryDatabase(String query) {
    final ResultSet queryResult = _db.select(query);
    return queryResult;
  }

  static void close() {
    _singleton._db.dispose();
  }
}
