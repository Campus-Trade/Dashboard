import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Constants/Text_Style_Manger.dart';

class SelectedButton extends StatefulWidget {
  final String text;
  final Color color;
  final void Function()? onPressed;
  SelectedButton({
    super.key,
    required this.text,
    required this.color,
    required this.onPressed,
  });

  @override
  State<SelectedButton> createState() => _SelectedButtonState();
}

class _SelectedButtonState extends State<SelectedButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.w,
      height: 35.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 10.h),
          backgroundColor: widget.color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        onPressed: widget.onPressed,
        child: Text("${widget.text}", style: TextStyles.white14Regular),
      ),
    );
  }
}
