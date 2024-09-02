// Helper class containing static methods for building SQL query components
import 'package:feedback_ideas_app_server/src/services/sqlite_utils.dart';

class SqliteQueryHelper {
  // Method to build the conditions string for WHERE clause
  static String buildConditionsString(Map<String, dynamic> conditions) {
    return conditions.entries
        .map((entry) => "${entry.key}='${entry.value}'")
        .join(' AND ');
  }

  // Method to build the JOIN statements for multiple joins
  static String buildJoinStatements(List<SqlJoin> joins, String tableName) {
    return joins.map((join) {
      return '${join.joinType.toUpperCase()} JOIN ${join.joinTable} ON ${join.joinConditions}';
    }).join(' ');
  }

  // Method to construct the select string with fields from the main table, joins, and CASE fields
  static String buildSelectString(
    String tableName,
    List<String> tableFields,
    List<SqlJoin> joins,
    List<SqlCaseField> caseFields,
  ) {
    final tableFieldsFull = tableFields.map((e) => '$tableName.$e').toList();
    final joinFieldsFull = joins.expand((join) =>
        join.joinTableFields.map((field) => field.getSelectQuery(join.joinTable)))
        .toList();
    final caseFieldsFull = caseFields.map((caseField) => caseField.buildCaseString()).toList();

    return [
      tableFields.isEmpty ? '$tableName.*' : tableFieldsFull.join(','),
      joinFieldsFull.join(','),
      caseFieldsFull.join(','),
    ].where((field) => field.isNotEmpty).join(',');
  }
}