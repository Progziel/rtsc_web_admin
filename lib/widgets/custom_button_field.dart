import 'package:flutter/material.dart';
import 'package:rtsc_web/widgets/custom_text_widgets.dart';

import '../utils/constants/colors.dart';
class CustomButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  Color? buttonColor;

  final VoidCallback onTap;
  CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.textColor,
    this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 40.0,
          width: 100,
          decoration: BoxDecoration(
              color: buttonColor ?? AppColors.canvasColor,
              borderRadius: BorderRadius.circular(12.0)),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Center(
              child: CustomTextWidget(
                text: text,
                fSize: 12,
                fWeight: FontWeight.normal,
                textColor: textColor ?? Colors.white60,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButtonAndIcon extends StatelessWidget {
  final String text;
  final Color textColor;
  Color? buttonColor;
  final VoidCallback onTap;
  IconData? icon;

  CustomButtonAndIcon({
    super.key,
    required this.text,
    required this.textColor,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: buttonColor ?? Colors.black26,
              borderRadius: BorderRadius.circular(12.0)),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextWidget(
                    text: text,
                    fSize: 12,
                    fWeight: FontWeight.normal,
                    textColor: textColor ?? Colors.white60,
                  ),
                  const SizedBox(width: 10.0),
                  Icon(
                    icon,
                    color: Colors.white,
                    size: 15,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}