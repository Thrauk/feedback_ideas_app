import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:email_validator/email_validator.dart';
import 'package:feedback_ideas_app_client/feedback_ideas_app_client.dart';
import 'package:feedback_ideas_app_flutter/main.dart';
import 'package:feedback_ideas_app_flutter/src/features/authentication/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  bool _emailAlreadyExistsError = false;
  bool _displayActivationMessage = false;
  final formKey = GlobalKey<ShadFormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ShadInputFormField(
                  label: const Text('Email'),
                  // placeholder: const Text('Email'),
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
                  label: const Text('First name'),
                  controller: _firstNameController,
                  validator: (v) {
                    if (v.isEmpty) {
                      return 'First Name field cannot be empty!.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 4),
                ShadInputFormField(
                  label: const Text('Last Name'),
                  controller: _lastNameController,
                  validator: (v) {
                    if (v.isEmpty) {
                      return 'Last Name field cannot be empty!.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 4),
                ShadInputFormField(
                  obscureText: true,
                  label: const Text('Password'),
                  controller: _passwordController,
                  validator: (v) {
                    if (v.length < 6) {
                      return 'Password must be at least 6 characters!.';
                    }
                    return null;
                  },
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Divider(
                    height: 4,
                  ),
                ),
                if (_emailAlreadyExistsError)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text('An account with this email address already exists!'),
                  ),
                if (_displayActivationMessage)
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ShadCard(
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
                        final res = await serverpodClient.user.register(
                          email: _emailController.text,
                          password: _encrypt256(_passwordController.text),
                          firstName: _firstNameController.text,
                          lastName: _lastNameController.text,
                        );
                        if (res) {
                          setState(() {
                            _displayActivationMessage = true;
                            _emailAlreadyExistsError = false;
                          });
                        }
                      } on RegisterException catch (e) {
                        setState(() {
                          _emailAlreadyExistsError = true;
                        });
                      }
                    }
                  },
                  child: const Text('Register'),
                ),
                const SizedBox(height: 4),
                ShadButton.link(
                  child: const Text('Already have an account? Log in.'),
                  onPressed: () => LoginScreen.go(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
