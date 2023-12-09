import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final double? fSize;
  final FontWeight? fWeight;
  final Color? textColor;
  final TextAlign? textAlign;
  const CustomTextWidget(
      {super.key,
      this.fSize,
      this.fWeight,
      required this.text,
      this.textColor,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.poppins(
        fontSize: fSize ?? (context.isLargeTablet ? 16 : 14),
        fontWeight: fWeight ?? FontWeight.normal,
        color: textColor ?? Colors.black54,
      ),
      //overflow: TextOverflow.ellipsis,
    );
  }
}
