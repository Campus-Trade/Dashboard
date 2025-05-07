import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Constants/Color_Manager.dart';
import '../../../../Constants/Text_Style_Manger.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Orders", style: TextStyles.black20Bold),
        Container(
          width: 56.w,
          height: 24.h,
          decoration: BoxDecoration(
            color: ColorManager.SecondaryColor,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Center(child: Text("Latest", style: TextStyles.white14Bold)),
        ),
      ],
    );
  }
}
