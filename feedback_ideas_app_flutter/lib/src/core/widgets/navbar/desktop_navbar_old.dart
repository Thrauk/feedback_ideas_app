import 'package:feedback_ideas_app_flutter/main.dart';
import 'package:feedback_ideas_app_flutter/src/core/widgets/navbar/desktop_navbar_button.dart';
import 'package:feedback_ideas_app_flutter/src/features/feed/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class DesktopNavbarOld extends StatelessWidget {
  const DesktopNavbarOld({
    super.key,
    required this.state,
    required this.child,
  });

  final GoRouterState state;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                  // color: ATColors.dark,
                  // color: Color(0xffF5F5F4),
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  border: Border.all(
                    color: Color(0xffF5F5F4),
                    width: 4,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      DesktopNavbarButton(
                        onPressed: () => _onNavigationPressed(
                          context: context,
                          targetRoute: MainScreen.route,
                        ),
                        isSelected: _isRouteSelected(MainScreen.route, context),
                        buttonLabel: 'Feed',
                      ),
                      DesktopNavbarButton(
                        onPressed: () => _onNavigationPressed(
                          context: context,
                          targetRoute: '',
                        ),
                        isSelected: false,
                        buttonLabel: 'My Ideas',
                      ),
                      DesktopNavbarButton(
                        onPressed: () => _onNavigationPressed(
                          context: context,
                          targetRoute: '',
                        ),
                        isSelected: false,
                        buttonLabel: 'Profile',
                      ),
                      const Spacer(),
                      DesktopNavbarButton(
                        onPressed: () => _onNavigationPressed(
                          context: context,
                          targetRoute: '',
                        ),
                        isSelected: false,
                        buttonLabel: 'Settings',
                      ),
                      ShadButton.destructive(
                        onPressed: () async {
                          await authManager.remove();
                        },
                        width: double.infinity,
                        child: const Text('Log Out'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }

  void _onNavigationPressed({
    required BuildContext context,
    required String targetRoute,
  }) {
    if (_isRouteSelected(targetRoute, context)) {
      context.go(targetRoute);
    } else {
      context.push(targetRoute);
    }
  }

  bool _isRouteSelected(String route, context) => GoRouterState.of(context).uri.toString().split('?')[0] == route;
}
