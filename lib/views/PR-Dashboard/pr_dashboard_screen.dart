import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rtsc_web/utils/constants/colors.dart';
import 'package:rtsc_web/views/PR-Dashboard/components/table.dart';

import '../../widgets/custom_text_widgets.dart';

class PRDashboardScreen extends StatefulWidget {
  const PRDashboardScreen({Key? key}) : super(key: key);

  @override
  State<PRDashboardScreen> createState() => _PRDashboardScreenState();
}

class _PRDashboardScreenState extends State<PRDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: CustomTextWidget(
          text: 'Admin Dashboard',
          fSize: context.isLandscape ? 20 : 16,
          fWeight: FontWeight.w400,
          textColor: Colors.white,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: const PRMemberTable(),
    );
  }
}
