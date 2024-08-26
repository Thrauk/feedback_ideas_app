import 'package:feedback_ideas_app_server/src/generated/protocol.dart';
import 'package:feedback_ideas_app_server/src/repository/auth/activation_code_repository.dart';
import 'package:feedback_ideas_app_server/src/repository/auth/jwt_repository.dart';
import 'package:feedback_ideas_app_server/src/repository/auth/smtp_repository.dart';
import 'package:feedback_ideas_app_server/src/repository/user/user_repository.dart';
import 'package:serverpod/serverpod.dart';

class UserEndpoit extends Endpoint {
  Future<bool> register(
    Session session, {
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    try {
      final User? user = UserRepository().registerUser(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
      );

      /// Move in Login??
      if (user != null) {
        await _sendActivationEmail(user, email);
      }
    } catch (e) {
      print(e);

      /// Also re-verify the format of the data and it being valid, this could trigger another error.
      throw RegisterException(
        message: 'Email already exists!',
        type: RegisterExceptionType.emailAreadyExists,
      );
    }

    return true;
  }

  Future<LoginResponse> login(
    Session session, {
    required String email,
    required String password,
  }) async {
    final bool result = UserRepository().checkUserPassword(email: email, password: password);
    print("User $email logged in ${result ? 'successfully' : 'unsucessfully'}");

    if (!result) {
      throw LoginException(
        message: 'Username or password is incorrect!',
        type: LoginExceptionType.invalidLogin,
      );
    }

    final User user = UserRepository().getUserByEmail(email);

    if (!user.isActivated) {
      await _sendActivationEmail(user, email);
      throw (
        LoginException(
          message: 'User is not activated!',
          type: LoginExceptionType.inactiveAccount,
        ),
      );
    }

    /// is userUuid is null, throw error
    final String token = JwtRepository().createToken(
      uuid: user.uuid,
      userId: user.id!,
      email: email,
    );
    return LoginResponse(token: token);
  }

  Future<void> _sendActivationEmail(User user, String email) async {
    final activationCode = ActivationCodeRepository().generateActivationCodeForUser(user.uuid);
    await SmtpRepository().sendActivationEmail(email, activationCode);
  }
}
