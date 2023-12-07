import 'package:flutter/material.dart';
import 'package:rtsc_web/views/PR-Dashboard/pr_dashboard_screen.dart';
import 'package:rtsc_web/views/post/create_post.dart';
import 'package:sidebarx/sidebarx.dart';

class ScreensView extends StatelessWidget {
  const ScreensView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final pageTitle = getTitleByIndex(controller.selectedIndex);
        switch (controller.selectedIndex) {
          case 0:
            return ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              itemBuilder: (context, index) => Container(
                height: 100,
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red,
                  boxShadow: const [BoxShadow()],
                ),
              ),
            );
          case 1:
            return PRDashboardScreen();
          case 2:
            return CreatePostScreen();
          default:
            return Text(
              pageTitle,
              style: theme.textTheme.headlineSmall,
            );
        }
      },
    );
  }
}

String getTitleByIndex(int index) {
  switch (index) {
    case 0:
      return 'Home';
    case 1:
      return 'PR Member';
    case 2:
      return 'Post';
    case 3:
      return 'Analytics';
    case 4:
      return 'Profile';
    case 5:
      return 'Settings';
    case 6:
      return 'Logout';
    default:
      return 'Not found page';
  }
}
