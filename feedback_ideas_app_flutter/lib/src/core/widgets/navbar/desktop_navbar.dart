import 'package:feedback_ideas_app_flutter/main.dart';
import 'package:feedback_ideas_app_flutter/src/core/widgets/navbar/desktop_navbar_button.dart';
import 'package:feedback_ideas_app_flutter/src/features/feed/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class DesktopNavbar extends StatelessWidget {
  const DesktopNavbar({
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
        child: Column(
          children: [
            Container(
              height: 56,
              decoration: const BoxDecoration(
                // color: ATColors.dark,
                color: Color(0xffF5F5F4),

                // color: Colors.red,
                // borderRadius: BorderRadius.all(Radius.circular(4)),
                border: Border(
                  bottom: BorderSide(
                    color: Color.fromARGB(255, 201, 201, 201),
                    width: 1,
                  ),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
                child: Row(
                  children: [
                    ShadButton.link(
                      child: Text('Home/Feed'),
                      onPressed: () {},
                    ),
                    ShadButton.link(
                      child: Text('My Ideas'),
                      onPressed: () {},
                    ),
                    ShadButton.link(
                      child: Text('Profile'),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              // child: Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Column(
              //     children: [
              //       DesktopNavbarButton(
              //         onPressed: () => _onNavigationPressed(
              //           context: context,
              //           targetRoute: MainScreen.route,
              //         ),
              //         isSelected: _isRouteSelected(MainScreen.route, context),
              //         buttonLabel: 'Feed',
              //       ),
              //       DesktopNavbarButton(
              //         onPressed: () => _onNavigationPressed(
              //           context: context,
              //           targetRoute: '',
              //         ),
              //         isSelected: false,
              //         buttonLabel: 'My Ideas',
              //       ),
              //       DesktopNavbarButton(
              //         onPressed: () => _onNavigationPressed(
              //           context: context,
              //           targetRoute: '',
              //         ),
              //         isSelected: false,
              //         buttonLabel: 'Profile',
              //       ),
              //       const Spacer(),
              //       DesktopNavbarButton(
              //         onPressed: () => _onNavigationPressed(
              //           context: context,
              //           targetRoute: '',
              //         ),
              //         isSelected: false,
              //         buttonLabel: 'Settings',
              //       ),
              //       ShadButton.destructive(
              //         onPressed: () async {
              //           await authManager.remove();
              //         },
              //         width: double.infinity,
              //         child: const Text('Log Out'),
              //       ),
              //     ],
              //   ),
              // ),
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
