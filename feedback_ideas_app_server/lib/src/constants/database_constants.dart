class DatabaseConstants {
  static const String userTable = 'users';
  static const String activationCodeTable = 'activation_codes';
  static const String ideaTable = 'ideas';
  static const String ideaVoteTable = 'idea_votes';

  static Map<String, String> creationQueries = {
    userTable: createUserTableQuery,
    activationCodeTable: createActivationCodeTableQuery,
    ideaTable: createIdeasTableQuery,
    ideaVoteTable: createIdeasVoteTableQuery,
  };

  static const String createUserTableQuery = '''
    CREATE TABLE $userTable (
      id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
      uuid TEXT NOT NULL UNIQUE,
      email TEXT NOT NULL UNIQUE,
      password TEXT NOT NULL,
      firstName TEXT NOT NULL,
      lastName TEXT NOT NULL,
      isActivated INTEGER NOT NULL DEFAULT 0
    );
  ''';

  static const String createActivationCodeTableQuery = '''
      CREATE TABLE $activationCodeTable (
        id INTEGER NOT NULL PRIMARY KEY,
        userUuid TEXT NOT NULL,
        activationCode TEXT NOT NULL,
        expiryDate DATETIME NOT NULL,
        isUsed INTEGER NOT NULL DEFAULT 0,
        FOREIGN KEY (userUuid) REFERENCES $userTable(uuid)
      );
  ''';

  static const String createIdeasTableQuery = '''
      CREATE TABLE $ideaTable (
        id INTEGER NOT NULL PRIMARY KEY,
        uuid TEXT NOT NULL UNIQUE,
        postedAt DATETIME NOT NULL,
        title TEXT NOT NULL,
        content TEXT NOT NULL,
        authorUuid TEXT NOT NULL,
        votesNumber INTEGER DEFAULT 0,
        commentsNumber INTEGER DEFAULT 0,
        FOREIGN KEY (authorUuid) REFERENCES $userTable(uuid)
      );
  ''';

  static const String createIdeasVoteTableQuery = '''
      CREATE TABLE $ideaVoteTable (
        id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        userUuid TEXT NOT NULL,
        ideaUuid TEXT NOT NULL,
        votedAt DATETIME NOT NULL,
        FOREIGN KEY (userUuid) REFERENCES $userTable(uuid),
        FOREIGN KEY (ideaUuid) REFERENCES $ideaTable(uuid)
      );
  ''';
}
