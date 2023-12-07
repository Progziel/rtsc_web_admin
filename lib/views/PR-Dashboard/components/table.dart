import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rtsc_web/models/pr_member_model.dart';
import 'package:rtsc_web/utils/constants/colors.dart';
import 'package:rtsc_web/widgets/custom_text_widgets.dart';

class PRMemberTable extends StatefulWidget {
  const PRMemberTable({Key? key}) : super(key: key);

  @override
  _PRMemberTableState createState() => _PRMemberTableState();
}

class _PRMemberTableState extends State<PRMemberTable> {
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
  ];

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
            child: DataTable(
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
                for (int index = 0; index < prMembers.length; index++)
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
                          CustomTextWidget(text: prMembers[index].firstName)),
                      DataCell(CustomTextWidget(
                          text: prMembers[index].lastName.toString())),
                      DataCell(CustomTextWidget(
                          text: prMembers[index].email.toString())),
                      DataCell(CustomTextWidget(
                          text: prMembers[index].phoneNumber.toString())),
                      DataCell(TextButton(
                          onPressed: () {},
                          child: CustomTextWidget(
                            text: 'Accept',
                            textColor: Colors.white60,
                          ))),
                      DataCell(TextButton(
                          onPressed: () {},
                          child: CustomTextWidget(
                            text: 'Reject',
                            textColor: Colors.redAccent,
                          )))
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
