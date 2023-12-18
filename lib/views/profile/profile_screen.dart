import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:rtsc_web/utils/constants/colors.dart';
import 'package:rtsc_web/widgets/custom_button_field.dart';
import 'package:rtsc_web/widgets/custom_text_widgets.dart';

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.canvasColor,
        title: CustomTextWidget(
          text: 'Profile',
          fSize: context.isLandscape ? 20 : 16,
          fWeight: FontWeight.w400,
          textColor: Colors.grey,
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.transparent),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
    );
  }
}

class GeneralSettings extends StatefulWidget {
  const GeneralSettings({super.key});

  @override
  State<GeneralSettings> createState() => _GeneralSettingsState();
}

class _GeneralSettingsState extends State<GeneralSettings> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  File? _image;

  Future getImage() async {
    final image = await ImagePickerWeb.getImageAsFile();
    setState(() {
      _image = image;
    });
  }

  @override
  void initState() {
    nameController.text = 'Adam James';
    emailController.text = 'prmember@gmail.com';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTextWidget(
          text: 'General Information',
          fSize: 16.0,
          fWeight: FontWeight.w700,
        ),
        const SizedBox(height: 15.0),
        Stack(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: _image != null
                  ? NetworkImage(Url.createObjectUrl(_image))
                  : const NetworkImage(
                      'assets/images/user.jpg'), // Use NetworkImage for local assets
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 40,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.upload,
                    size: 20.0,
                  ),
                  onPressed: () {
                    getImage();
                  },
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20.0),
        TextFormField(
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            controller: nameController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                hoverColor: Colors.grey.shade300,
                filled: true,
                fillColor: Colors.grey.shade200,
                hintStyle: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black12),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                hintText: 'Name',
                prefixIcon: const Icon(CupertinoIcons.person),
                isCollapsed: false)),
        const SizedBox(height: 20.0),
        TextFormField(
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            controller: emailController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                hoverColor: Colors.grey.shade300,
                filled: true,
                fillColor: Colors.grey.shade200,
                hintStyle: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black12),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                hintText: 'Email',
                prefixIcon: const Icon(Icons.email),
                isCollapsed: false)),
        const SizedBox(height: 20.0),
        CustomButton(
          text: 'Save',
          onTap: () {},
        )
      ],
    );
  }
}

class PasswordSettings extends StatefulWidget {
  const PasswordSettings({super.key});

  @override
  State<PasswordSettings> createState() => _PasswordSettingsState();
}

class _PasswordSettingsState extends State<PasswordSettings> {
  TextEditingController currentPasswordController = TextEditingController();

  TextEditingController newPasswordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.32,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CustomTextWidget(
            text: 'Change Password',
            fSize: 16.0,
            fWeight: FontWeight.w700,
          ),
          const SizedBox(height: 20.0),
          TextFormField(
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              controller: currentPasswordController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  hoverColor: Colors.grey.shade300,
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black12),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  hintText: 'Current Password',
                  prefixIcon: const Icon(CupertinoIcons.person),
                  isCollapsed: false)),
          const SizedBox(height: 20.0),
          TextFormField(
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              controller: newPasswordController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  hoverColor: Colors.grey.shade300,
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black12),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  hintText: 'New Password',
                  prefixIcon: const Icon(Icons.email),
                  isCollapsed: false)),
          const SizedBox(height: 20.0),
          TextFormField(
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              controller: confirmPasswordController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  hoverColor: Colors.grey.shade300,
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black12),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  hintText: 'Confirm Password',
                  prefixIcon: const Icon(Icons.email),
                  isCollapsed: false)),
          const SizedBox(height: 20.0),
          CustomButton(
            text: 'Save',
            onTap: () {},
          )
        ],
      ),
    );
  }
}
