import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:feedback_ideas_app_client/feedback_ideas_app_client.dart';
import 'package:feedback_ideas_app_flutter/main.dart';
import 'package:flutter/material.dart';

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
          child: Column(
            children: [
              const Text(
                'Email',
              ),
              TextFormField(
                controller: _emailController,
              ),
              const Text(
                'First name',
              ),
              TextFormField(
                controller: _firstNameController,
              ),
              const Text(
                'Last Name',
              ),
              TextFormField(
                controller: _lastNameController,
              ),
              const Text(
                'Password',
              ),
              TextFormField(
                controller: _passwordController,
              ),
              ElevatedButton(
                onPressed: () async {
                  await serverpodClient.userEndpoit.register(
                    email: _emailController.text,
                    password: _encrypt256(_passwordController.text),
                    firstName: _firstNameController.text,
                    lastName: _lastNameController.text,
                  );
                },
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
