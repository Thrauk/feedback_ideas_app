enum SqlOrderType {
  ascending('ASC'),
  descending('DESC');

  const SqlOrderType(this.value);
  final String value;
}

class SqlOrderBy {
  const SqlOrderBy({
    required this.key,
    required this.orderType,
  });
  final String key;
  final SqlOrderType orderType;
}

// Class to represent each SQL join with necessary details
class SqlJoin {
  final String joinTable;
  final String joinType; // LEFT, INNER, etc.
  final Map<String, String> joinConditions; // Conditions to join on
  final List<SqlJoinTableField> joinTableFields; // Fields to select from the join table

  SqlJoin({
    required this.joinTable,
    this.joinType = 'INNER',
    required this.joinConditions,
    this.joinTableFields = const [],
  });
}

// Helper class to represent SQL join fields
class SqlJoinTableField {
  final String fieldName;
  final String alias;

  SqlJoinTableField({
    required this.fieldName,
    this.alias = '',
  });

  // Method to construct the select query for the field, including aliasing if needed
  String getSelectQuery(String tableName) {
    return alias.isNotEmpty ? '$tableName.$fieldName AS $alias' : '$tableName.$fieldName';
  }
}

// Class to define a CASE statement field, making it flexible for various scenarios
class SqlCaseField {
  final String caseCondition; // The condition for the CASE
  final String trueValue; // Value when the condition is true
  final String falseValue; // Value when the condition is false
  final String alias; // Alias for the resulting field

  SqlCaseField({
    required this.caseCondition,
    this.trueValue = '1',
    this.falseValue = '0',
    required this.alias,
  });

  // Builds the CASE WHEN SQL string
  String buildCaseString() {
    return "CASE WHEN $caseCondition THEN $trueValue ELSE $falseValue END AS $alias";
  }
}
