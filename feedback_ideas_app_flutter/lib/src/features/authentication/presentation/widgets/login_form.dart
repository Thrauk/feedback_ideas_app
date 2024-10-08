import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:email_validator/email_validator.dart';
import 'package:feedback_ideas_app_client/feedback_ideas_app_client.dart';
import 'package:feedback_ideas_app_flutter/main.dart';
import 'package:feedback_ideas_app_flutter/src/features/authentication/presentation/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  final formKey = GlobalKey<ShadFormState>();
  bool _loginError = false;
  bool _displayActivationMessage = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  String _encrypt256(String textPassword) {
    final Uint8List bytes = utf8.encode(textPassword);
    final Digest encryptedPassword = sha256.convert(bytes);
    return encryptedPassword.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 500,
          child: ShadForm(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ShadInputFormField(
                  label: const Text('Email'),
                  controller: _emailController,
                  validator: (v) {
                    if (!EmailValidator.validate(v) || v.length < 3) {
                      return 'Email address is invalid!';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 4),
                ShadInputFormField(
                  obscureText: true,
                  label: const Text('Password'),
                  controller: _passwordController,
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Divider(
                    height: 4,
                  ),
                ),
                if (_loginError)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text('Email or password is incorrect!'),
                  ),
                if (_displayActivationMessage)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const ShadCard(
                      width: double.infinity,
                      title: Text('Activation required'),
                      description: Text('An email has been sent to your email address to activate your account.'),
                    ),
                  ),
                ShadButton(
                  width: double.infinity,
                  onPressed: () async {
                    if (formKey.currentState!.saveAndValidate()) {
                      try {
                        final LoginResponse response = await serverpodClient.user.login(
                          email: _emailController.text,
                          password: _encrypt256(_passwordController.text),
                        );
                        authManager.put(response.token);
                      } on LoginException catch (e) {
                        if (e.type == LoginExceptionType.inactiveAccount) {
                          setState(() {
                            _displayActivationMessage = true;
                          });
                        } else {
                          ShadToaster.of(context).show(
                            const ShadToast(
                              description: Text('Email or password is incorrect!'),
                            ),
                          );
                          setState(() {
                            _loginError = true;
                          });
                        }
                      }
                    }
                  },
                  child: const Text('Login'),
                ),
                const SizedBox(height: 4),
                ShadButton.link(
                  child: const Text("Don't have an account? Register!"),
                  onPressed: () => RegisterScreen.go(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
