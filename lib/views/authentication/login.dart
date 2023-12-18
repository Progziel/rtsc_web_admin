import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:video_player/video_player.dart';

import '../../widgets/custom_text_widgets.dart';
import '../../widgets/custom_textformfield.dart';
import '../dashboard_screen.dart';
import 'forgot_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  VideoPlayerController? controller;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset('assets/video/video.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
        controller?.setLooping(true);
        controller?.setVolume(0); // Mute the video
        controller?.play();
        print('video is playing');
      }).onError((error, stackTrace) => null);
  }
  // @override
  // void initState() {
  //   super.initState();
  //   controller = VideoPlayerController.asset('assets/video/video.mp4')
  //     ..initialize().then((_) {
  //       // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
  //       setState(() {});
  //       controller?.setLooping(true);
  //
  //       controller?.play();
  //       print('video is playing');
  //     }).onError((error, stackTrace) => null);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FractionallySizedBox(
            widthFactor: 1.0,
            heightFactor: controller!.value.aspectRatio,
            child: VideoPlayer(controller!),
          ),
          Positioned(
            right: 60,
            top: 50,
            child: Container(
              padding: const EdgeInsets.all(40.0),
              color: Colors.black45,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Center(
                  //   child: const CustomTextWidget(
                  //     text: "Application to access PR Dashboard",
                  //     textColor: Colors.white,
                  //     fSize: 20,
                  //     fWeight: FontWeight.w800,
                  //   )
                  //       .animate(
                  //         onPlay: (controller) =>
                  //             controller.repeat(reverse: true),
                  //       )
                  //       .fadeOut(curve: Curves.easeInOut),
                  // ),
                  CustomTextWidget(
                    text: 'LOGIN',
                    textColor: Colors.white,
                    fSize: 30.0,
                    fWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                        text: 'Email',
                        textColor: Colors.white,
                        fSize: 14.0,
                        fWeight: FontWeight.w500,
                      ),
                      const SizedBox(height: 5),
                      NewCustomTextField(
                        text: 'Email',
                        controller: emailController,
                      ),
                      const SizedBox(height: 15),
                      CustomTextWidget(
                        text: 'Password',
                        textColor: Colors.white,
                        fSize: 14.0,
                        fWeight: FontWeight.w500,
                      ),
                      const SizedBox(height: 5),
                      NewCustomTextField(
                        text: 'Password',
                        controller: passwordController,
                        obscure: true,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      if(emailController.text == "admin" && passwordController.text == "boxing@123"){
                        Get.offAll(() => DashboardPage(),
                            transition: Transition.rightToLeft);
                      }
                      else{
                        final snackBar = const SnackBar(
                          content:  Text('Email or password is incorrect!'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    child: Container(
                      height: Get.height * 0.07,
                      width: Get.width * 0.2,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red,
                      ),
                      child:  Center(
                        child: CustomTextWidget(
                          text: 'Log in',
                          fSize: 14,
                          textColor: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: (){
                      Get.offAll(()=> ForgetPasswordScreen(controller: controller));
                    },
                    child: CustomTextWidget(
                      text: 'Forgot Password?',
                      textColor: Colors.white,
                      fWeight: FontWeight.w500,
                      textAlign: TextAlign.end,
                    ),
                  ),



                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
