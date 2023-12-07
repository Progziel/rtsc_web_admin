import 'package:flutter/material.dart';
import 'package:rtsc_web/widgets/custom_text_widgets.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Color buttonColor;

  final VoidCallback onTap;
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.textColor,
    required this.buttonColor,
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
            color: buttonColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Center(
              child: CustomTextWidget(
                text: text,
                fSize: 14,
                fWeight: FontWeight.normal,
                textColor: textColor ?? Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
