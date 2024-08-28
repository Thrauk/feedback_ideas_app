import 'package:feedback_ideas_app_client/feedback_ideas_app_client.dart';
import 'package:feedback_ideas_app_flutter/main.dart';
import 'package:feedback_ideas_app_flutter/src/features/authentication/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ActivationPageWidget extends StatefulWidget {
  const ActivationPageWidget({
    super.key,
    this.queryParameters = const <String, dynamic>{},
  });

  final Map<String, dynamic> queryParameters;

  @override
  State<ActivationPageWidget> createState() => _ActivationPageWidgetState();
}

class _ActivationPageWidgetState extends State<ActivationPageWidget> {
  bool isLoading = true;
  bool isError = false;
  String? activationCode;

  @override
  void initState() {
    super.initState();
    activationCode = widget.queryParameters['code'];
    if (activationCode != null) {
      () async {
        try {
          await serverpodClient.user.activateAccount(activationCode: activationCode!);
          setState(() {
            isLoading = false;
          });
        } on ActiveAccountException catch (e) {
          setState(() {
            isLoading = false;
            isError = true;
          });
          ShadToaster.of(context).show(
            ShadToast(
              title: const Text('Uh oh! Something went wrong'),
              description: Text('Could not activate accout: ${e.message}'),
            ),
          );
        }
      }.call();
    }
  }

  @override
  void didUpdateWidget(covariant ActivationPageWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('Did update widget');
    print(widget.queryParameters);

    if (oldWidget.queryParameters != widget.queryParameters) {
      activationCode = widget.queryParameters['code'];
      if (activationCode != null) {
        () async {
          try {
            await serverpodClient.user.activateAccount(activationCode: activationCode!);
            setState(() {
              isLoading = false;
            });
          } on ActiveAccountException catch (e) {
            ShadToaster.of(context).show(
              ShadToast(
                title: const Text('Uh oh! Something went wrong'),
                description: Text('Could not activate accout: ${e.message}'),
              ),
            );
          }
        }.call();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isError)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: ShadCard(
                width: 500,
                title: Text('Error'),
                description: Text('Code is invalid or has expired!'),
              ),
            )
          else
            Text('Account activated!'),
          ShadButton(
            width: 500,
            child: const Text('Go to login!'),
            onPressed: () {
              LoginScreen.go(context);
            },
          ),
        ],
      ),
    );
  }
}
