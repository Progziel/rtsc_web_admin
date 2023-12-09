import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rtsc_web/utils/constants/colors.dart';
import 'package:rtsc_web/views/pr_member/pr_member_table.dart';
import 'package:rtsc_web/widgets/custom_text_widgets.dart';
import 'package:rtsc_web/widgets/custom_textformfield.dart';

import '../../widgets/custom_button_field.dart';

class PRMemberScreen extends StatelessWidget {
  const PRMemberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.canvasColor,
        title: CustomTextWidget(
          text: 'PR Members',
          fSize: context.isLandscape ? 20 : 16,
          fWeight: FontWeight.w400,
          textColor: Colors.grey,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            Row(
              children: [
                CustomTextField(
                  hintText: 'Search',
                  icon: CupertinoIcons.search,
                ),
                CustomButtonAndIcon(
                    text: 'Sort',
                    textColor: Colors.white,
                    onTap: () {},
                    icon: Icons.sort_outlined),
                CustomButtonAndIcon(
                    text: 'Filter',
                    textColor: Colors.white,
                    onTap: () {},
                    icon: Icons.filter_alt_outlined)
              ],
            ),
            SizedBox(height: 15.0),
            PRMembersTable()
          ],
        ),
      ),
    );
  }
}
