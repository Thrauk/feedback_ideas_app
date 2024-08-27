import 'package:feedback_ideas_app_server/src/constants/app_constants.dart';
import 'package:feedback_ideas_app_server/src/constants/database_constants.dart';
import 'package:feedback_ideas_app_server/src/generated/protocol.dart';
import 'package:feedback_ideas_app_server/src/services/sqlite_service.dart';
import 'package:mailer/mailer.dart';
import 'package:uuid/uuid.dart';

class ActivationCodeRepository {
  static final ActivationCodeRepository _singleton = ActivationCodeRepository._internal();

  factory ActivationCodeRepository() {
    return _singleton;
  }

  ActivationCodeRepository._internal();

  String generateActivationCodeForUser(String userUuid) {
    final code = Uuid().v4();
    _storeActivationCode(userUuid: userUuid, code: code);
    return code;
  }

  ActivationCode? getActivationCodeByCode(String activationCode) {
    final activationCodeQuery = SqliteService().queryRowByConditions(
      tableName: DatabaseConstants.activationCodeTable,
      conditions: {
        'activationCode': activationCode,
      },
    );
    return activationCodeQuery != null ? ActivationCode.fromJson(activationCodeQuery) : null;
  }

  void _storeActivationCode({
    required String userUuid,
    required String code,
  }) {
    final expiryDate = DateTime.now().add(Duration(minutes: 1));
    final ActivationCode activationCode = ActivationCode(
      userUuid: userUuid,
      activationCode: code,
      expiryDate: expiryDate,
    );
    SqliteService().insertIntoTable(
      table: DatabaseConstants.activationCodeTable,
      data: activationCode.toJson(),
    );
  }
}
