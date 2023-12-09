import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenView extends StatelessWidget {
  final Widget child;
  final double? height;
  const ScreenView({Key? key,required this.child,this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: Get.width,
        height: height,
        decoration: BoxDecoration(
            border: Border.all(
                color: Colors.grey
            )
        ),
        child: child,
      ),
    );
  }
}
