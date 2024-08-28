import 'package:feedback_ideas_app_flutter/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class MainPageWidget extends StatelessWidget {
  const MainPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('You are home!'),
          ShadButton(
            child: Text('Log out'),
            onPressed: () async {
              await authManager.remove();
            },
          ),
        ],
      ),
    );
  }
}
