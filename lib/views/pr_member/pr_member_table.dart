import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rtsc_web/models/pr_member_model.dart';
import 'package:rtsc_web/models/user_model.dart';
import 'package:rtsc_web/utils/constants/colors.dart';
import 'package:rtsc_web/widgets/custom_text_widgets.dart';

import '../../controllers/user_controller.dart';
import '../../widgets/custom_button_field.dart';
import 'member_info_table.dart';

class PRMembersTable extends StatefulWidget {
  const PRMembersTable({Key? key}) : super(key: key);

  @override
  _PRMembersTableState createState() => _PRMembersTableState();
}

class _PRMembersTableState extends State<PRMembersTable> {
  late UserController userController;

  bool selectAll = false;
  @override
  void initState() {
    userController = Get.find<UserController>();
    // TODO: implement initState
    super.initState();
  }
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
            child: GetBuilder<UserController>(
              builder: (controller) {
                return DataTable(
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
                        text: 'S NO.',
                        fSize: context.isLandscape ? 16 : 14,
                      ),
                    ),
                    DataColumn(
                      label: CustomTextWidget(
                        text: 'First Name',
                        fSize: context.isLandscape ? 16 : 14,
                      ),
                    ),
                    DataColumn(
                      label: CustomTextWidget(
                        text: 'Last Name',
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
                        text: 'Phone Number',
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
                    for (int index = 0; index < userController.acceptedUsers.length; index++)
                      DataRow(
                        mouseCursor: MaterialStateMouseCursor.clickable,
                        color: MaterialStateColor.resolveWith((states) {
                          return index % 2 == 0
                              ? AppColors.accentCanvasColor
                              : AppColors.canvasColor;
                        }),
                        cells: [
                           DataCell(
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                        backgroundColor: Colors.grey[300], // Change the background color if needed
                          radius: 30, // Adjust the size of the avatar as required
                          child: SvgPicture.asset(
                            'assets/images/user5.svg', // Replace with your SVG file path
                            width: 40,
                            height: 40,
                          ),
                        ),
                      ),
                          ),

                          DataCell(CustomTextWidget(text: (index + 1).toString())),
                          DataCell(
                            CustomTextWidget(text: userController.acceptedUsers[index].firstName),
                          ),
                          DataCell(CustomTextWidget(
                              text: userController.acceptedUsers[index].lastName)),
                          DataCell(CustomTextWidget(
                              text: userController.acceptedUsers[index].email)),
                          DataCell(CustomTextWidget(
                              text: userController.acceptedUsers[index].phoneNumber ?? "")),
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
                                return CustomPRMemberDescription(
                                  userDetail: userController.acceptedUsers[index]
                                );
                              },
                              openElevation: 0,
                              closedElevation:
                                  0, // Set elevation to 0 to remove the shadow
                              closedShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                            ),
                          ),

                        ],
                      ),
                  ],
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}

class CustomPRMemberDescription extends StatelessWidget {
  final UserModel userDetail;
  const CustomPRMemberDescription({
    super.key, required this.userDetail
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
          PRMemberInfo(userDetail: userDetail),
          PRMemberInfoTable(userDetail: userDetail),
        ],
      ),
    );
  }
}

class PRMemberInfo extends StatelessWidget {
  final UserModel userDetail;
  const PRMemberInfo({
    super.key, required this.userDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.canvasColor,
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
            backgroundColor: Colors.grey[300], // Change the background color if needed
              radius: 60, // Adjust the size of the avatar as required
              child: SvgPicture.asset(
                'assets/images/user5.svg', // Replace with your SVG file path
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
                SizedBox(width: context.width * 0.05),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextWidget(
                      text: "${userDetail.firstName}${userDetail.lastName}",
                      fSize: 24.0,
                      fWeight: FontWeight.w700,
                    ),
                    CustomTextWidget(
                      text: "email: ${userDetail.email}",
                      fSize: 14.0,
                      fWeight: FontWeight.w400,
                    ),
                    CustomTextWidget(
                      text: "Phone No: ${userDetail.phoneNumber}",
                      fSize: 14.0,
                      fWeight: FontWeight.w400,
                    ),
                    CustomTextWidget(
                      text: 'Status: ${userDetail.accepted == true ? "Activated" : "Pause"}',
                      fSize: 16.0,
                      fWeight: FontWeight.w400,
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
