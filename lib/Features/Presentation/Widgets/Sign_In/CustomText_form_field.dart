import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  Widget? icon;
  final bool? obscureText;
  CustomTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    this.icon,
    required this.obscureText,
  });
  String? ValidateData(String? controller) {
    if (controller == null || controller.isEmpty) {
      switch (hintText) {
        case "Mobile number or email":
          return "Please enter your email or mobile number";
        case "password":
          return "Please enter your password";
        default:
          return "Please enter a valid input";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: TextFormField(
        validator: ValidateData,
        obscureText: obscureText!,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: icon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.grey, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.grey, width: 1),
          ),
        ),
      ),
    );
  }
}
