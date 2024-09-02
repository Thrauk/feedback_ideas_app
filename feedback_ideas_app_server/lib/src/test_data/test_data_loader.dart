import 'dart:convert';
import 'dart:io';

import 'package:feedback_ideas_app_server/src/constants/database_constants.dart';
import 'package:feedback_ideas_app_server/src/services/sqlite_service.dart';

class TestDataLoader {
  static const String usersFilePath = 'assets/development_app_data/users.json'; // Update with the actual path
  static const String ideasFilePath = 'assets/development_app_data/ideas.json'; // Update with the actual path

  static Future<List<Map<String, dynamic>>> _loadJsonFile(String filePath) async {
    try {
      // Read the file as a string
      final fileContent = await File(filePath).readAsString();

      // Decode the string into a List of Maps
      return List<Map<String, dynamic>>.from(jsonDecode(fileContent));
    } catch (e) {
      print('Error reading or parsing $filePath: $e');
      return [];
    }
  }

  static Future<void> loadDevelopmentData(String tableName) async {
    if (tableName == DatabaseConstants.userTable) {
      final List<Map<String, dynamic>> users = await _loadJsonFile(usersFilePath);

      for (final user in users) {
        SqliteService().insertIntoTable(
          table: DatabaseConstants.userTable,
          data: user,
        );
      }
      return;
    }

    if (tableName == DatabaseConstants.ideaTable) {
      final List<Map<String, dynamic>> ideas = await _loadJsonFile(ideasFilePath);

      for (final idea in ideas) {
        SqliteService().insertIntoTable(
          table: DatabaseConstants.ideaTable,
          data: idea,
        );
      }
      return;
    }
  }
}
