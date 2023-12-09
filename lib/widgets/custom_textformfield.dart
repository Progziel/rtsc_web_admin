import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final Function(String)? onChanged;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,

      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey ), // Default border color
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white), // Border color when focused
        ),

        border: const OutlineInputBorder(
        ),

      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
      onChanged: onChanged,

      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        // You can add additional validation logic here if needed
        return null;
      },
    );
  }
}


class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  IconData? icon;
  TextInputType? keyboardType;
  CustomTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.keyboardType,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 45,
        child: TextFormField(
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            controller: controller,
            keyboardType: keyboardType ?? TextInputType.text,
            decoration: InputDecoration(
              hoverColor: Colors.grey,
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
                hintText: hintText,
                prefixIcon: Icon(icon),
                isCollapsed: false)),
      ),
    );
  }
}