import 'package:feedback_ideas_app_server/src/constants/database_constants.dart';

class IdeaSqlQueries {
  static const ideaTable = DatabaseConstants.ideaTable;
  static const userTable = DatabaseConstants.userTable;
  static const ideaVoteTable = DatabaseConstants.ideaVoteTable;

  static const String getExtededIdeasQuery = '''
    SELECT 
        $ideaTable.*,
        $userTable.firstName AS authorFirstName,
        $userTable.lastName AS authorLastName,
        CASE 
            WHEN $ideaVoteTable.id IS NOT NULL THEN 1
            ELSE 0
        END AS votedByCurrentUser
    FROM 
        $ideaTable
    JOIN 
        $userTable
    ON 
        $ideaTable.authorUuid = $userTable.uuid
    LEFT JOIN 
        $ideaVoteTable
    ON 
        $ideaTable.uuid = $ideaVoteTable.ideaUuid
        AND $ideaVoteTable.userUuid = ?
    ORDER BY 
        $ideaTable.postedAt DESC;
''';
}
