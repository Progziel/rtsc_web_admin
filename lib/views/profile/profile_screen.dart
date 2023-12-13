import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rtsc_web/utils/constants/colors.dart';
import 'package:rtsc_web/widgets/custom_button_field.dart';
import 'package:rtsc_web/widgets/custom_text_widgets.dart';
import 'package:rtsc_web/widgets/custom_textformfield.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: context.height * 0.7,
        decoration: BoxDecoration(
          color: Colors.white60,
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                        text: 'Settings', fSize: 20, fWeight: FontWeight.w700),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Container(
                  height: 50,
                  width: context.isLandscape ? 350 : 270,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TabBar(
                    padding: const EdgeInsets.all(10),
                    controller: _tabController,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: AppColors.primaryColor,
                    ),
                    labelStyle: GoogleFonts.poppins(
                        fontSize: context.isLandscape ? 16 : 10,
                        color: Colors.white),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    indicatorSize: TabBarIndicatorSize.tab,
                    mouseCursor: MaterialStateMouseCursor.clickable,
                    tabs: const [
                      Tab(
                        text: 'General',
                        height: 40,
                      ),
                      Tab(
                        text: 'Password',
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TabBarView(
                    controller: _tabController,
                    children: const [
                      GeneralSettings(),
                      PasswordSettings(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GeneralSettings extends StatelessWidget {
  const GeneralSettings({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.32,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomTextWidget(
            text: 'General Information',
            fSize: 16.0,
            fWeight: FontWeight.w700,
          ),
          const SizedBox(height: 15.0),
          CustomTextField(hintText: 'Enter your Name'),
          const SizedBox(height: 15.0),
          CustomTextField(hintText: 'Enter your Email'),
          const SizedBox(height: 15.0),
          CustomTextField(hintText: 'Enter your Number'),
          const SizedBox(height: 15.0),
          CustomButton(
            text: 'Save',
            onTap: () {},
          )
        ],
      ),
    );
  }
}

class PasswordSettings extends StatelessWidget {
  const PasswordSettings({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.32,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomTextWidget(
            text: 'Change Password',
            fSize: 16.0,
            fWeight: FontWeight.w700,
          ),
          const SizedBox(height: 15.0),
          CustomTextField(hintText: 'Current Password'),
          const SizedBox(height: 15.0),
          CustomTextField(hintText: 'Create Password'),
          const SizedBox(height: 15.0),
          CustomTextField(hintText: 'Confirm Password'),
          const SizedBox(height: 15.0),
          CustomButton(
            text: 'Save',
            onTap: () {},
          )
        ],
      ),
    );
  }
}