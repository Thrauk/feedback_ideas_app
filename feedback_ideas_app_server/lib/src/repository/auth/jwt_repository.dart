import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:dotenv/dotenv.dart';
import 'package:feedback_ideas_app_server/src/generated/protocol.dart';

class JwtRepository {
  static final JwtRepository _singleton = JwtRepository._internal();
  late final DotEnv _env;
  late final String _jwtSecret;
  late final SecretKey _secretKey;
  final Duration _tokenExpirationTime = Duration(hours: 2);

  factory JwtRepository() {
    return _singleton;
  }

  JwtRepository._internal() {
    _env = DotEnv(includePlatformEnvironment: true)..load();
    try {
      _jwtSecret = _env['JWT_SECRET']!;
    } catch (e) {
      throw Exception('ENV doesn\'t contain JWT secret!');
    }
    _secretKey = SecretKey(_jwtSecret);
  }

  String createToken({
    required String email,
    required String uuid,
    required int userId,
  }) {
    final DateTime expirationDate = DateTime.now().add(_tokenExpirationTime);
    final int expirationTimestamp = expirationDate.millisecondsSinceEpoch;
    final JwtPayload payload = JwtPayload(
      scopes: <String>['default'],
      userEmail: email,
      expirationTimestamp: expirationTimestamp,
      userUuid: uuid,
      userId: userId,
    );

    final JWT jwt = JWT(payload.toJson(), issuer: 'company.example.com');
    final String token = jwt.sign(_secretKey, expiresIn: _tokenExpirationTime);
    return token;
  }

  JWT? checkToken(String token) {
    try {
      final JWT jwt = JWT.verify(token, _secretKey);
      return jwt;
    } on JWTExpiredException {
      print('TOKEN EXPIRED');
    } on JWTException catch (ex) {
      print(ex.message);
    }
    return null;
  }

  int? extractIdFromJwt(JWT jwt) {
    return (jwt.payload as Map<String, dynamic>)['userId'];
  }
}
