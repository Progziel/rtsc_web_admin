import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rtsc_web/models/pr_member_model.dart';
import 'package:rtsc_web/utils/constants/colors.dart';
import 'package:rtsc_web/widgets/custom_text_widgets.dart';

import '../../widgets/custom_button_field.dart';
import 'member_info_table.dart';

class PRMembersTable extends StatefulWidget {
  const PRMembersTable({Key? key}) : super(key: key);

  @override
  _PRMembersTableState createState() => _PRMembersTableState();
}

class _PRMembersTableState extends State<PRMembersTable> {
  bool selectAll = false;

  List<PRMemberModel> prMembers = [
    PRMemberModel('James', 'Watson', 'james@gmail.com', 1234567890),
    PRMemberModel('Alice', 'Johnson', 'alice@gmail.com', 9876543210),
    PRMemberModel('Bob', 'Smith', 'bob@gmail.com', 5678901234),
    PRMemberModel('Emily', 'Davis', 'emily@gmail.com', 3456789012),
    PRMemberModel('John', 'Miller', 'john@gmail.com', 7890123456),
    PRMemberModel('Sophia', 'Brown', 'sophia@gmail.com', 2345678901),
    PRMemberModel('Michael', 'Lee', 'michael@gmail.com', 8901234567),
    PRMemberModel('Olivia', 'Garcia', 'olivia@gmail.com', 4567890123),
    PRMemberModel('William', 'Taylor', 'william@gmail.com', 6789012345),
    PRMemberModel('Ava', 'Martin', 'ava@gmail.com', 9012345678),
    PRMemberModel('William', 'Taylor', 'william@gmail.com', 6789012345),
    PRMemberModel('Ava', 'Martin', 'ava@gmail.com', 9012345678),
    PRMemberModel('Sophia', 'Brown', 'sophia@gmail.com', 2345678901),
    PRMemberModel('Michael', 'Lee', 'michael@gmail.com', 8901234567),
    PRMemberModel('Olivia', 'Garcia', 'olivia@gmail.com', 4567890123),
    PRMemberModel('William', 'Taylor', 'william@gmail.com', 6789012345),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: context.height * 0.75,
        width: context.width,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
        ),
        child: SingleChildScrollView(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              horizontalMargin: 50.0,
              dividerThickness: 2.0,
              columns: [
                DataColumn(
                  label: CustomTextWidget(
                    text: '',
                    fSize: context.isLandscape ? 16 : 14,
                  ),
                ),
                DataColumn(
                  label: CustomTextWidget(
                    text: 'Name',
                    fSize: context.isLandscape ? 16 : 14,
                  ),
                ),
                DataColumn(
                  label: CustomTextWidget(
                    text: 'ID',
                    fSize: context.isLandscape ? 16 : 14,
                  ),
                ),
                DataColumn(
                  label: CustomTextWidget(
                    text: 'Age',
                    fSize: context.isLandscape ? 16 : 14,
                  ),
                ),
                DataColumn(
                  label: CustomTextWidget(
                    text: 'Email',
                    fSize: context.isLandscape ? 16 : 14,
                  ),
                ),
                DataColumn(
                  label: CustomTextWidget(
                    text: 'Post Shared',
                    fSize: context.isLandscape ? 16 : 14,
                  ),
                ),
                DataColumn(
                  label: CustomTextWidget(
                    text: '',
                    fSize: context.isLandscape ? 16 : 14,
                  ),
                ),
                DataColumn(
                  label: CustomTextWidget(
                    text: '',
                    fSize: context.isLandscape ? 16 : 14,
                  ),
                ),
              ],
              rows: [
                for (int index = 0; index < prMembers.length; index++)
                  DataRow(
                    mouseCursor: MaterialStateMouseCursor.clickable,
                    color: MaterialStateColor.resolveWith((states) {
                      return index % 2 == 0
                          ? AppColors.accentCanvasColor
                          : AppColors.canvasColor;
                    }),
                    cells: [
                      const DataCell(
                        CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/user5.jpg'),
                          // child: Image.asset('assets/images/user.jpg'),
                        ),
                      ),
                      DataCell(
                        CustomTextWidget(text: prMembers[index].firstName),
                      ),
                      DataCell(CustomTextWidget(text: (index + 1).toString())),
                      DataCell(CustomTextWidget(
                          text: prMembers[index].lastName.toString())),
                      DataCell(CustomTextWidget(
                          text: prMembers[index].email.toString())),
                      DataCell(CustomTextWidget(
                          text: prMembers[index].phoneNumber.toString())),
                      DataCell(
                        OpenContainer(
                          openColor: Colors.transparent,
                          closedColor: Colors.transparent,
                          transitionDuration: const Duration(milliseconds: 500),
                          closedBuilder: (context, action) {
                            return CustomButton(
                              text: 'View',
                              onTap: action,
                              buttonColor: Colors.grey,
                            );
                          },
                          openBuilder: (context, action) {
                            return CustomPRMemberDescription();
                          },
                          openElevation: 0,
                          closedElevation:
                              0, // Set elevation to 0 to remove the shadow
                          closedShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                      ),
                      DataCell(
                        CustomButton(
                          text: 'Remove',
                          onTap: () {},
                          buttonColor: Colors.redAccent,
                        ),
                      )
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomPRMemberDescription extends StatelessWidget {
  const CustomPRMemberDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: CustomTextWidget(
          text: 'Members',
          fSize: context.isLandscape ? 20 : 16,
          fWeight: FontWeight.w400,
          textColor: Colors.white,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          PRMemberInfo(),
          PRMemberInfoTable(),
        ],
      ),
    );
  }
}

class PRMemberInfo extends StatelessWidget {
  const PRMemberInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/user5.jpg'),
                  radius: 60,
                ),
                SizedBox(width: context.width * 0.05),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextWidget(
                      text: 'James Vince',
                      fSize: 24.0,
                      fWeight: FontWeight.w700,
                    ),
                    CustomTextWidget(
                      text: 'United States',
                      fSize: 16.0,
                      fWeight: FontWeight.w300,
                    ),
                    CustomTextWidget(
                      text: 'james_vince@gmail.com',
                      fSize: 14.0,
                      fWeight: FontWeight.w400,
                    ),
                    CustomTextWidget(
                      text: 'Status',
                      fSize: 16.0,
                      fWeight: FontWeight.w300,
                    ),
                    CustomTextWidget(
                      text: 'Online',
                      fSize: 14.0,
                      fWeight: FontWeight.w300,
                    ),
                  ],
                ),
              ],
            ),
            CustomTextWidget(
              text: 'PR Member',
              fSize: 22.0,
              fWeight: FontWeight.w700,
            ),
          ],
        ),
      ),
    );
  }
}
