import 'package:flutter/material.dart';
import 'package:rtsc_web/views/analytics/analytics_screen.dart';
import 'package:rtsc_web/views/post/create_post.dart';
import 'package:rtsc_web/views/pr_member/pr_members.dart';
import 'package:rtsc_web/views/pr_request/request_screen.dart';
import 'package:rtsc_web/views/profile/profile_screen.dart';
import 'package:sidebarx/sidebarx.dart';

import '../home/home_screen.dart';

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
            return HomeScreen();
          case 1:
            return PRMemberScreen();
          case 2:
            return RequestScreen();
          case 3 :
            return CreatePostScreen();
          case 4 :
            return AnalyticsScreen();
          case 5 :
            return ProfileScreen();
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
      return 'Request';
    case 4:
      return 'Analytics';
    case 5:
      return 'Profile';
    case 6:
      return 'Logout';
    default:
      return 'Not found page';
  }
}
