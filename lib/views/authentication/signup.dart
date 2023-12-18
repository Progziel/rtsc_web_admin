import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:rtsc_web/views/authentication/login.dart';
import 'package:rtsc_web/widgets/custom_text_widgets.dart';
import 'package:video_player/video_player.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  VideoPlayerController? _controller;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   _controller = VideoPlayerController.asset('assets/19057717.mp4')
  //     ..initialize().then((_) {
  //       // Ensure the first frame is shown
  //       setState(() {});
  //       // Loop the video
  //       _controller?.setLooping(true);
  //       // Start playing the video
  //       _controller?.play();
  //     });
  // }

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/video/video.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
        _controller?.setLooping(true);

        _controller?.play();
        print('video is playing');
      }).onError((error, stackTrace) => null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        FractionallySizedBox(
          widthFactor: 1.0, // This ensures the video covers the full width
          heightFactor: _controller!.value.aspectRatio,
          child: VideoPlayer(_controller!),
        ),
        Positioned(
          right: 60,
          top: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: const CustomTextWidget(
                  text: "Register to get started.",
                  textColor: Colors.white,
                  fSize: 20,
                  fWeight: FontWeight.w800,
                )
                    .animate(
                        onPlay: (controller) =>
                            controller.repeat(reverse: true))
                    .fadeOut(curve: Curves.easeInOut),
              ),
              const SizedBox(height: 10),
              CustomTextField(
                text: 'First Name',
                controller: fnameController,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                text: 'Last Name',
                controller: lnameController,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                text: 'Phone Number (Optional)',
                controller: numberController,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                text: 'Date of Birth (Optional)',
                controller: numberController,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                text: 'Address',
                controller: numberController,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                text: 'Email',
                controller: emailController,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                text: 'Password',
                controller: passwordController,
              ),
              const SizedBox(width: 15),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    //   Get.to(() => const DashboardScreen());
                    // Implement your email login logic here
                  },
                  child: Container(
                    height: Get.height * 0.07,
                    width: Get.width * 0.08,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red,
                    ),
                    child: const Center(
                      child: CustomTextWidget(
                        text: 'Register',
                        fSize: 14,
                        textColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () => Get.to(
                  const LoginScreen(),
                  // transition: Transition.downToUp,
                ),
                child: RichText(
                  text: const TextSpan(
                    text: 'Already a PR Member? ',
                    style: TextStyle(
                        fontWeight: FontWeight.w300, color: Colors.grey),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }
}

class CustomTextField extends StatelessWidget {
  final String text;
  final TextEditingController? controller;
  bool? obscure = false;
   CustomTextField({
    super.key,
    required this.text,
    required this.controller,
    this.obscure
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade200.withOpacity(0.1),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscure ?? false,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          // labelText: text,
          // labelStyle:
          //     const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.white)),
        ),
      ),
    );
  }
}
