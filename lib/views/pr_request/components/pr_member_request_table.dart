import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rtsc_web/controllers/user_controller.dart';
import 'package:rtsc_web/models/pr_member_model.dart';
import 'package:rtsc_web/models/user_model.dart';
import 'package:rtsc_web/utils/constants/colors.dart';
import 'package:rtsc_web/widgets/custom_text_widgets.dart';

import '../../../widgets/custom_button_field.dart';

class PRMemberRequestTable extends StatefulWidget {
  const PRMemberRequestTable({Key? key}) : super(key: key);

  @override
  _PRMemberRequestTableState createState() => _PRMemberRequestTableState();
}

class _PRMemberRequestTableState extends State<PRMemberRequestTable> {
  bool selectAll = false;
  late UserController userController;
  // List<UserModel> userModel = [
  //   UserModel(firstName: "PR",lastName: "1",email: "pr1@gmail.com",phoneNumber: "9121211111",accepted: false),
  //   UserModel(firstName: "PR",lastName: "2",email: "pr2@gmail.com",phoneNumber: "9121211121",accepted: false),
  //   UserModel(firstName: "PR",lastName: "3",email: "pr3@gmail.com",phoneNumber: "9121211133",accepted: false),
  //   UserModel(firstName: "PR",lastName: "4",email: "pr4@gmail.com",phoneNumber: "9121211144",accepted: false),
  //   UserModel(firstName: "PR",lastName: "5",email: "pr5@gmail.com",phoneNumber: "9121211114",accepted: false),
  //   UserModel(firstName: "PR",lastName: "6",email: "pr6@gmail.com",phoneNumber: "9121211115",accepted: false),
  // ];

@override
  void initState() {
    userController = Get.put(UserController());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: context.height * 0.9,
        width: context.width,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
        ),
        child: SingleChildScrollView(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: GetBuilder<UserController>(
              builder: (userController) {
                return DataTable(
                  horizontalMargin: 50.0,
                  dividerThickness: 2.0,
                  columns: [
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
                    DataColumn(
                      label: CustomTextWidget(
                        text: '',
                        fSize: context.isLandscape ? 16 : 14,
                      ),
                    ),
                  ],
                  rows: [
                    for (int index = 0; index < userController.users.length; index++)
                      DataRow(
                        mouseCursor: MaterialStateMouseCursor.clickable,
                        color: MaterialStateColor.resolveWith((states) {
                          return index % 2 == 0
                              ? AppColors.accentCanvasColor
                              : AppColors.canvasColor;
                        }),
                        cells: [
                          DataCell(CustomTextWidget(text: (index + 1).toString())),
                          DataCell(
                              CustomTextWidget(text: userController.users[index].firstName)),
                          DataCell(CustomTextWidget(
                              text: userController.users[index].lastName.toString())),
                          DataCell(CustomTextWidget(
                              text: userController.users[index].email.toString())),
                          DataCell(CustomTextWidget(
                              text: userController.users[index].phoneNumber.toString())),
                          DataCell(
                            CustomButton(
                              text: 'Accept',
                              onTap: () {
                                userController.acceptUser(userController.users[index]);
                              },
                              buttonColor: Colors.green,
                            ),
                          ),
                          DataCell(
                            CustomButton(
                              text: 'Reject',
                              onTap: () {},
                              buttonColor: Colors.redAccent,
                            ),
                          )
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
