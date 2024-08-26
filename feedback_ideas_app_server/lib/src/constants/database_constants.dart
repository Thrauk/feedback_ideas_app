class DatabaseConstants {
  static const String userTable = 'users';
  static const String activationCodeTable = 'activation_codes';

  static const String createUserTableQuery = '''
    CREATE TABLE $userTable (
      id INTEGER NOT NULL PRIMARY KEY,
      uuid TEXT NOT NULL UNIQUE,
      email TEXT NOT NULL UNIQUE,
      password TEXT NOT NULL,
      firstName TEXT NOT NULL,
      lastName TEXT NOT NULL,
      isActivated BOOLEAN NOT NULL
    );
  ''';

    static const String createActivationCodeTableQuery = '''
      CREATE TABLE $activationCodeTable (
        id INTEGER NOT NULL PRIMARY KEY,
        userUuid TEXT NOT NULL,
        activationCode TEXT NOT NULL,
        expiryDate DATETIME NOT NULL,
        isUsed BOOLEAN NOT NULL DEFAULT 0,
        FOREIGN KEY (userUuid) REFERENCES $userTable(uuid)
      );
  ''';

}
