import 'package:dashboard/Features/Presentation/Constants/Color_Manager.dart';
import 'package:dashboard/Features/Presentation/Constants/Text_Style_Manger.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  void Function()? onPressed;
  String? text;
  CustomButton({super.key, required this.onPressed, required this.text});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        child: Text("${widget.text}"),

        style: ElevatedButton.styleFrom(
          textStyle: TextStyleManger.boldStyle14,
          backgroundColor: ColorManager.primaryColor,
          foregroundColor: ColorManager.secondaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 154.5, vertical: 13),
        ),
      ),
    );
  }
}
