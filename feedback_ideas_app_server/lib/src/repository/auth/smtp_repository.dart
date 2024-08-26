import 'package:dotenv/dotenv.dart';
import 'package:feedback_ideas_app_server/src/constants/app_constants.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class SmtpRepository {
  static final SmtpRepository _singleton = SmtpRepository._internal();
  late final DotEnv _env;
  late final String _smtpEmail;
  late final String _smtpPassword;
  late final SmtpServer _smtpServer;

  factory SmtpRepository() {
    return _singleton;
  }

  SmtpRepository._internal() {
    _env = DotEnv(includePlatformEnvironment: true)..load();
    try {
      _smtpEmail = _env['SMTP_EMAIL']!;
      _smtpPassword = _env['SMTP_PASSWORD']!;
      _smtpServer = gmail(_smtpEmail, _smtpPassword);
    } catch (e) {
      throw Exception('ENV doesn\'t contains the correct SMTP data!');
    }
  }

  Future<void> sendActivationEmail(String email, String activationCode) async {
    final activationUrl = '${AppConstants.webClientAppUrl}/${AppConstants.clientAppActivationRoute}?code=$activationCode';
    final message = Message()
      ..from = Address(_smtpEmail, 'Feedback Ideas App')
      ..recipients.add(email)
      ..subject = 'Account Activation'
      ..text = 'Please activate your account by following this url: $activationUrl';

    try {
      final sendReport = await send(message, _smtpServer);
      print('Message sent: $sendReport');
    } on MailerException catch (e) {
      print('Message not sent. $e');
    }
  }
}
