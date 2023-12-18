import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rtsc_web/views/authentication/signup.dart';
import 'package:rtsc_web/widgets/custom_text_widgets.dart';
import 'package:video_player/video_player.dart';

class ForgetPasswordScreen extends StatefulWidget {
  final VideoPlayerController? controller;
  const ForgetPasswordScreen({
    super.key,
    required this.controller,
  });

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  VideoPlayerController? _controller;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   _controller = VideoPlayerController.asset(widget.controller)
  //     ..initialize().then((_) {
  //       // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
  //       setState(() {});
  //       _controller?.setLooping(true);
  //
  //       _controller?.play();
  //       print('video is playing');
  //     }).onError((error, stackTrace) => null);
  // }
  @override
  void initState() {
    widget.controller?.setLooping(true);
    widget.controller?.play();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FractionallySizedBox(
            widthFactor: 1.0,
            heightFactor: widget.controller!.value.aspectRatio,
            child: VideoPlayer(widget.controller!),
          ),
          Positioned(
            right: 60,
            top: 50,
            child: Container(
              padding: const EdgeInsets.all(40.0),
              color: Colors.black45,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  const CustomTextWidget(
                    text: 'Forget Password?',
                    textColor: Colors.white,
                    fSize: 24.0,
                    fWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 15),
                  const CustomTextWidget(
                    text: 'Email',
                    textColor: Colors.white,
                    fSize: 14.0,
                    fWeight: FontWeight.w500,
                  ),
                  const SizedBox(height: 5),
                  CustomTextField(
                    text: 'Enter your Email',
                    controller: emailController,
                  ),
                  const SizedBox(height: 15),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      final snackBar = const SnackBar(
                        backgroundColor: Colors.green,
                        content: const CustomTextWidget(
                          text:
                              'Reset Password link has been sent to your email.',
                          textColor: Colors.white,
                        ),
                        duration: Duration(seconds: 3),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: Container(
                      height: Get.height * 0.07,
                      width: Get.width * 0.2,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red,
                      ),
                      child: Center(
                        child: const CustomTextWidget(
                          text: 'Send Reset Password Link',
                          fSize: 14,
                          textColor: Colors.white,
                        ),
                      ),
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
